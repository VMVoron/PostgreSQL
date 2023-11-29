--создаем таблицу для топа пользователей
--CREATE MATERIALIZED VIEW IF NOT EXISTS top_users AS
--SELECT a.id_client, c.client_name, a.balance
--FROM account a
--JOIN client c ON a.id_client = c.id_client
--ORDER BY a.balance DESC
--LIMIT 10;

CREATE TABLE IF NOT EXISTS top_users (
    id_client INTEGER,
    client_name VARCHAR(512) NOT NULL,
    balance NUMERIC
);

--создаем функцию обновления топа пользователей
DROP FUNCTION IF EXISTS dbo.update_top_users_trigger;
CREATE OR REPLACE FUNCTION update_top_users_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Удаляем предыдущие данные из таблицы top_users
    DELETE FROM top_users;
    
    -- Вставляем новые данные в таблицу top_users
    INSERT INTO top_users (id_client, client_name, balance)
    SELECT a.id_client, c.client_name, a.balance
    FROM account A
    JOIN client c ON a.id_client = c.id_client
    ORDER BY balance DESC
    LIMIT 10; -- Вставляем первые 10 пользователей с наибольшим балансом
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- создаем триггер для изменения топа пользователей
DROP TRIGGER IF EXISTS accounts_update_trigger ON account;
CREATE TRIGGER accounts_update_trigger
AFTER UPDATE ON account
FOR EACH ROW
EXECUTE FUNCTION update_top_users_trigger();

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    order_number VARCHAR(10) NOT NULL,
    order_status VARCHAR(20) NOT NULL
);

-- Создание функции обновления статуса заказов
DROP FUNCTION IF EXISTS dbo.update_order_status;
CREATE OR REPLACE FUNCTION update_order_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.order_status = 'accept' THEN
        -- Обновляем статус заказа на "Принят"
        UPDATE orders SET order_status = 'accept' WHERE order_id = NEW.order_id;
    ELSIF NEW.order_status = 'decline' THEN
        -- Обновляем статус заказа на "Отклонен"
        UPDATE orders SET order_status = 'decline' WHERE order_id = NEW.order_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Создание триггера для обновления статуса заказов
DROP TRIGGER IF EXISTS update_order_status_trigger ON orders;
CREATE TRIGGER update_order_status_trigger
AFTER INSERT OR UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_order_status();

-- создаем таблицу для логгирования изменения баланса клиента
CREATE TABLE IF NOT EXISTS balance_log (
    id SERIAL PRIMARY KEY,
    account_id INTEGER,
    previous_balance DECIMAL(10,2),
    new_balance DECIMAL(10,2),
    change_date TIMESTAMP
);

-- создаем функцию для логгирования
DROP FUNCTION IF EXISTS dbo.log_balance_change;
CREATE OR REPLACE FUNCTION log_balance_change()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO balance_log (account_id, previous_balance, new_balance, change_date)
    VALUES (NEW.id_client, OLD.balance, NEW.balance, CURRENT_TIMESTAMP);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- создаем триггер для логирования
DROP TRIGGER IF EXISTS balance_change_trigger ON account;
CREATE TRIGGER balance_change_trigger
AFTER UPDATE ON account
FOR EACH ROW
WHEN (OLD.balance <> NEW.balance)
EXECUTE FUNCTION log_balance_change();

-- создаем таблицу статусов клиентов
CREATE TABLE IF NOT EXISTS client_status (
  id_client INT PRIMARY KEY,
  status VARCHAR(50)
);

-- функция обновления статуса клиента
--DROP FUNCTION IF EXISTS dbo.update_client_balance;
--CREATE OR REPLACE FUNCTION update_client_balance()
--RETURNS TRIGGER AS $$
--BEGIN
--  UPDATE account SET balance = balance - NEW.order_cost WHERE id_client = NEW.ID_Client;
--  RETURN NEW;
--END;
--$$ LANGUAGE plpgsql;
DROP FUNCTION IF EXISTS dbo.update_client_balance;
CREATE OR REPLACE FUNCTION update_client_balance()
RETURNS TRIGGER AS $$
BEGIN
  BEGIN
    UPDATE account SET balance = balance - NEW.order_cost WHERE id_client = NEW.ID_Client;
    
    IF (SELECT balance FROM account WHERE id_client = NEW.ID_Client) < 0 THEN
      -- Здесь вы можете заменить values(...) на необходимые значения для журнала
      CALL log_error('update_client_balance', 'negative balance', 'victoria');
    END IF;
    
    RETURN NEW;
  EXCEPTION
    WHEN others THEN
      -- Здесь вы можете заменить values(...) на необходимые значения для журнала
      CALL log_error('update_client_balance', 'negative balance', 'victoria');
  END;
END;
$$ LANGUAGE plpgsql;

-- создаем триггер для изменения статуса
DROP TRIGGER IF EXISTS update_balance_trigger ON ord_client;
CREATE TRIGGER update_balance_trigger
AFTER UPDATE OR INSERT ON ord_client
FOR EACH ROW
EXECUTE FUNCTION update_client_balance();

-- создаем функцию вычисления (перерасчета) статуса клиента
DROP FUNCTION IF EXISTS dbo.recalculate_client_status;
CREATE OR REPLACE FUNCTION recalculate_client_status()
RETURNS TRIGGER AS $$
DECLARE
  client_balance INT;
BEGIN
-- Проверяем, существует ли запись для данного id_client
  IF EXISTS (SELECT 1 FROM client_status WHERE id_client = NEW.id_client) THEN
    SELECT balance INTO client_balance FROM account WHERE id_client = NEW.id_client;

    -- Логика перерасчета статуса клиента
    IF client_balance > 1000 THEN
      UPDATE client_status SET status = 'VIP' WHERE id_client = NEW.id_client;
    ELSE
      UPDATE client_status SET status = 'Regular' WHERE id_client = NEW.id_client;
    END IF;
  ELSE
    -- Если записи не существует, выполняем INSERT
    INSERT INTO client_status (id_client, status) VALUES (NEW.id_client, 'Regular');
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- создаем триггер для перерасчета статуса клиента
DROP TRIGGER IF EXISTS recalculate_status_trigger ON account;
CREATE TRIGGER recalculate_status_trigger
AFTER UPDATE OR INSERT ON account
FOR EACH ROW
EXECUTE FUNCTION recalculate_client_status();
