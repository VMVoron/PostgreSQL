--
-- PostgreSQL database
--
SET client_encoding = 'UTF8';
--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--
COMMENT ON SCHEMA public IS 'Standard public schema';
--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--
SET search_path = public, pg_catalog;
--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--
CREATE SEQUENCE IF NOT EXISTS car_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS client_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS driver_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS change_id_seq START WITH 1;
CREATE SEQUENCE IF NOT EXISTS order_id_seq START WITH 1;

CREATE TYPE gearbox AS ENUM (
    'manual',
    'automatic'
);

CREATE OR REPLACE FUNCTION get_random_number()
RETURNS INTEGER AS $$
BEGIN
  RETURN FLOOR(RANDOM() * 101);
END;
$$ LANGUAGE plpgsql;

SELECT get_random_number();

-- Создание таблицы "error_log" для записи ошибок
CREATE TABLE IF NOT EXISTS error_log (
    error_id SERIAL PRIMARY KEY,
    procedure_name VARCHAR(50) NOT NULL,
    error_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    error_type VARCHAR(50),
    user_login VARCHAR(50)
);

- Создание процедуры для отлавливания и фиксации ошибок
DROP PROCEDURE IF EXISTS dbo.log_error;
CREATE OR REPLACE PROCEDURE log_error(
    procedure_name VARCHAR(50),
    error_type VARCHAR(50),
    user_login VARCHAR(50)
)Пу
AS $$
BEGIN
    -- Запись ошибки в журнальную таблицу
    INSERT INTO error_log (procedure_name, error_type, user_login)
    VALUES (procedure_name, error_type, user_login);
    
    -- Вывод сообщения об ошибке
    RAISE EXCEPTION 'Ошибка в процедуре %', procedure_name;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Вывод сообщения об ошибке при возникновении ошибки при записи в журнальную таблицу
        RAISE EXCEPTION 'Ошибка при записи в журнальную таблицу: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;
