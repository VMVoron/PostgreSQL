Update account
SET balance = 2000 WHERE id_client < 5;

INSERT INTO Ord_client (ID_client, Date_open, Adress_departure, Adress_arrival, order_cost)
VALUES
(1, '2022-01-01 12:00:00', '123 Main Street', '456 Maple Avenue', get_random_number()),
(2, '2022-01-05 16:00:00', '789 Oak Road', '321 Pine Lane', get_random_number()),
(3, '2022-01-08 10:00:00', '234 Elm Street', '567 Oak Avenue', get_random_number()),
(4, '2022-01-15 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(5, '2022-01-01 16:10:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(6, '2022-01-20 18:00:00', '901 Oak Lane', '234 Pine Street', get_random_number()),
(7, '2022-01-06 10:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(8, '2022-01-17 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(1, '2022-01-01 12:00:00', '123 Main Street', '456 Maple Avenue', get_random_number()),
(2, '2022-01-05 16:00:00', '789 Oak Road', '321 Pine Lane', get_random_number()),
(3, '2022-01-08 10:00:00', '234 Elm Street', '567 Oak Avenue', get_random_number()),
(4, '2022-01-15 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(5, '2022-01-01 16:10:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(6, '2022-01-20 18:00:00', '901 Oak Lane', '234 Pine Street', get_random_number()),
(7, '2022-01-06 10:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(8, '2022-01-17 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number());

Select * from balance_log;
SELECT * FROM client_status;
SELECT * from top_users;

INSERT INTO Ord_client (ID_client, Date_open, Adress_departure, Adress_arrival, order_cost)
VALUES
(1, '2022-01-01 12:00:00', '123 Main Street', '456 Maple Avenue', 3000);

--статистика по значениям индексных столбцов
--SELECT * FROM pg_stats;

--ловим код выполняемого запроса.
--SELECT pg_stat_get_backend_idset() AS backend_id, pg_stat_get_backend_activity(pg_stat_get_backend_idset()) AS query;
