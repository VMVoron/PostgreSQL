INSERT INTO Car (Brand, Model, State_number, Color, Seats, Child_seat, Year_manufactured, car_type, car_class, Gearbox, Date_t_service)
VALUES
('Toyota', 'Camry', 'ABC123', 'Blue', 5, true, 2018, 'Sedan', 'Economy', 'Automatic', '2022-01-01'),
('Honda', 'Civic', 'XYZ789', 'Red', 5, false, 2020, 'Sedan', 'Economy', 'Automatic', '2022-02-15'),
('BMW', 'X5', 'DEF456', 'Black', 7, true, 2019, 'SUV', 'Luxury', 'Automatic', '2022-03-10'),
('Volkswagen', 'Polo', 'BCD521', 'Dark-blue', 7, false, 2017, 'Sedan', 'Economy', 'Manual', '2021-03-10'),
('Ford', 'Focus', 'GHI789', 'Silver', 5, false, 2017, 'Hatchback', 'Compact', 'Manual', '2022-04-20'),
('Chevrolet', 'Cruze', 'JKL123', 'White', 5, true, 2019, 'Sedan', 'Economy', 'Automatic', '2022-06-01'),
('Mercedes-Benz', 'E-Class', 'MNO456', 'Gray', 5, false, 2020, 'Sedan', 'Luxury', 'Automatic', '2022-05-10'),
('Audi', 'Q5', 'PQR789', 'Black', 5, true, 2019, 'SUV', 'Luxury', 'Automatic', '2022-03-20'),
('Volkswagen', 'Golf', 'STU101', 'Blue', 5, true, 2018, 'Hatchback', 'Compact', 'Automatic', '2022-02-10'),
('Volvo', 'XC90', 'VWX246', 'Silver', 7, true, 2020, 'SUV', 'Luxury', 'Automatic', '2022-07-15'),
('Nissan', 'Altima', 'YZA789', 'Red', 5, false, 2018, 'Sedan', 'Economy', 'Automatic', '2022-06-10'),
('Hyundai', 'Tucson', 'BCD987', 'White', 5, true, 2021, 'SUV', 'Compact', 'Automatic', '2022-03-15'),
('Kia', 'Sportage', 'EFG123', 'Black', 5, false, 2019, 'SUV', 'Compact', 'Automatic', '2022-04-30'),
('Toyota', 'Corolla', 'HIJ456', 'Gray', 5, false, 2020, 'Sedan', 'Economy', 'Automatic', '2022-05-15');

INSERT INTO Driver (driver_name, Experience_date, Registration_date, Phone_number, Mail)
VALUES
('David Adams', '2017-01-01', '2020-01-01', '+7(123)4567890', 'david.adams@gmail.com'),
('Sarah Williams', '2018-03-15', '2022-01-01', '+7(234)5678901', 'sarah.williams@yahoo.com'),
('James Davis', '2014-06-30', '2018-06-30', '+7(345)6789012', 'james.davis@hotmail.com'),
('Emma Anderson', '2019-04-10', '2022-01-01', '+7(456)7890123', 'emma.anderson@example.com'),
('Liam Garcia', '2016-08-22', '2019-08-22', '+7(567)8901234', 'liam.garcia@example.com'),
('Mia Martinez', '2013-02-05', '2022-01-01', '+7(678)9012345', 'mia.martinez@example.com'),
('Aiden Johnson', '2018-11-20', '2021-11-20', '+7(789)0123456', 'aiden.johnson@example.com'),
('Amelia Brown', '2014-07-12', '2022-01-01', '+7(890)1234567', 'amelia.brown@example.com'),
('John Parker', '2014-10-28', '2017-10-28', '+7(901)2345678', 'john.parker@example.com'),
('Victoria Voron', '2010-05-17', '2020-05-17', '+7(012)3456789', 'victoria.voron@example.com');

INSERT INTO Client (client_name, Registration_date, Phone_number, Mail) 
VALUES 
('John Smith', '2006-12-31', '+7(123)4567890', 'john.smith@gmail.com'),
('Emily Johnson', '2007-11-15', '+7(234)5678901', 'emily.johnson@yahoo.com'),
('Michael Brown', '2008-10-01', '+7(345)6789012', 'michael.brown@hotmail.com'),
('Jessica Lee', '2009-09-05', '+7(456)7890123', 'jessica.lee@example.com'),
('Daniel Wilson', '2010-08-20', '+7(567)8901234', 'daniel.wilson@example.com'),
('Sophia Thompson', '2011-07-10', '+7(678)9012345', 'sophia.thompson@example.com'),
('Noah Davis', '2012-06-15', '+7(789)0123456', 'noah.davis@example.com'),
('Olivia Taylor', '2013-05-01', '+7(890)1234567', 'olivia.taylor@example.com'),
('David Adams','2014-01-01', '+7(123)4567890', 'david.adams@gmail.com'),
('Sarah Williams','2015-02-01', '+7(234)5678901', 'sarah.williams@yahoo.com'),
('Michael Johnson','2016-03-01', '+7(345)6789012', 'michael.johnson@example.com'),
('Emily Davis','2017-04-01', '+7(456)7890123', 'emily.davis@example.com'),
('Daniel Wilson','2018-05-01', '+7(567)8901234', 'daniel.wilson@example.com'),
('Olivia Thompson','2019-06-01', '+7(678)9012345', 'olivia.thompson@example.com'),
('James Martinez','2018-07-01', '+7(789)0123456', 'james.martinez@example.com'),
('Emma Anderson','2017-08-01', '+7(890)1234567', 'emma.anderson@example.com'),
('Joshua Davis','2016-09-01', '+7(901)2345678', 'joshua.davis@example.com'),
('Sophia Wilson','2017-10-01', '+7(012)3456789', 'sophia.wilson@example.com'),
('William Taylor','2018-11-01', '+7(123)4567890', 'william.taylor@example.com'),
('Ava Martinez','2019-12-01', '+7(234)5678901', 'ava.martinez@example.com');

INSERT INTO Account (ID_Client, Balance)
VALUES
(1, 1000),
(2, 500),
(3, 1500),
(4, 200),
(5, 900),
(6, 1200),
(7, 350),
(8, 800),
(9, 600),
(10, 100),
(11, 400),
(12, 750),
(13, 300),
(14, 1100),
(15, 650),
(16, 250),
(17, 700),
(18, 450),
(19, 850),
(20, 950);

INSERT INTO Change (ID_driver, ID_car, Date_open, Date_close, Cash_sum, Payment, Sent_payment) 
VALUES 
(1, 1, '2022-01-01 08:00:00', '2022-01-01 12:00:00', 1000, 800, true),
(2, 3, '2022-01-15 10:00:00', '2022-01-15 16:00:00', 1500, 1500, false),
(3, 2, '2022-01-05 14:00:00', '2022-01-05 18:00:00', 1200, 1000, true),
(4, 5, '2022-01-02 08:00:00', '2022-01-02 12:00:00', 1800, 1800, false),
(5, 7, '2022-01-25 16:00:00', '2022-01-25 20:00:00', 1400, 1200, true),
(6, 8,'2022-01-15 12:00:00', '2022-01-15 20:00:00', 2000, 2000, false),
(7, 6, '2022-01-01 10:00:00', '2022-01-01 20:00:00', 1500, 1400, true),
(8, 10, '2022-01-10 12:00:00', '2022-01-10 22:08:00', 1800, 1800, false),
(4, 11, '2022-01-15 14:00:00', '2022-01-15 23:50:00', 1600, 1500, true),
(5, 12, '2022-01-05 16:00:00', '2022-01-05 23:30:00', 1900, 1900, false),
(6, 13, '2022-01-20 11:00:00', '2022-01-20 22:00:00', 1700, 1600, true),
(7, 4, '2022-01-10 13:00:00', '2022-01-10 23:00:00', 2000, 2000, false),
(8, 9, '2022-01-03 09:00:00', '2022-01-03 15:00:00', 1200, 1000, true),
(9, 1, '2022-01-07 11:00:00', '2022-01-07 16:00:00', 1500, 1500, false),
(10, 3, '2022-01-09 13:00:00', '2022-01-09 18:00:00', 1800, 1800, true),
(1, 2, '2022-01-12 15:00:00', '2022-01-12 20:00:00', 1400, 1200, false),
(2, 5, '2022-01-18 08:00:00', '2022-01-18 12:00:00', 2000, 2000, true),
(3, 7, '2022-01-22 10:00:00', '2022-01-22 16:00:00', 1500, 1400, false),
(4, 8, '2022-01-16 12:00:00', '2022-01-16 20:00:00', 1800, 1800, true),
(5, 6, '2022-01-05 11:00:00', '2022-01-05 20:00:00', 1600, 1500, false),
(6, 10, '2022-01-04 14:00:00', '2022-01-04 23:30:00', 1900, 1900, true),
(7, 11, '2022-01-13 09:00:00', '2022-01-13 22:00:00', 1700, 1600, false),
(8, 12, '2022-01-19 10:00:00', '2022-01-19 23:00:00', 2000, 2000, true),
(9, 13, '2022-01-21 11:00:00', '2022-01-21 22:00:00', 1500, 1400, false),
(10, 4, '2022-01-28 12:00:00', '2022-01-28 23:00:00', 1800, 1800, true),
(1, 9, '2022-01-06 09:00:00', '2022-01-06 15:00:00', 1200, 1000, true),
(2, 1, '2022-01-08 11:00:00', '2022-01-08 16:00:00', 1500, 1500, false),
(3, 3, '2022-01-10 13:00:00', '2022-01-10 18:00:00', 1800, 1800, true),
(4, 2, '2022-01-13 15:00:00', '2022-01-13 20:00:00', 1400, 1200, false),
(5, 5, '2022-01-19 08:00:00', '2022-01-19 12:00:00', 2000, 2000, true),
(6, 7, '2022-01-23 10:00:00', '2022-01-23 16:00:00', 1500, 1400, false),
(7, 8, '2022-01-17 12:00:00', '2022-01-17 20:00:00', 1800, 1800, true),
(8, 6, '2022-01-06 11:00:00', '2022-01-06 20:00:00', 1600, 1500, false),
(9, 10, '2022-01-05 14:00:00', '2022-01-05 23:30:00', 1900, 1900, true),
(10, 11, '2022-01-14 09:00:00', '2022-01-14 22:00:00', 1700, 1600, false),
(1, 12, '2022-01-20 10:00:00', '2022-01-20 23:00:00', 2000, 2000, true),
(2, 13, '2022-01-22 11:00:00', '2022-01-22 22:00:00', 1500, 1400, false),
(3, 4, '2022-01-29 12:00:00', '2022-01-29 23:00:00', 1800, 1800, true);

INSERT INTO Ord_client (ID_client, Date_open, Adress_departure, Adress_arrival, order_cost)
VALUES
(1, '2022-01-01 12:00:00', '123 Main Street', '456 Maple Avenue', get_random_number()),
(2, '2022-01-15 16:00:00', '789 Oak Road', '321 Pine Lane', get_random_number()),
(3, '2022-01-10 10:00:00', '234 Elm Street', '567 Oak Avenue', get_random_number()),
(4, '2022-01-05 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(5, '2022-01-30 16:10:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(6, '2022-01-20 18:00:00', '901 Oak Lane', '234 Pine Street', get_random_number()),
(7, '2022-01-15 10:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(8, '2022-01-25 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(3, '2022-01-30 16:00:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(2, '2022-01-10 18:00:00', '901 Oak Lane', '234 Pine Street', get_random_number()),
(1, '2022-01-20 11:00:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(5, '2022-01-05 13:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(4, '2022-01-15 15:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(2, '2022-01-25 09:00:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(6, '2022-01-10 12:00:00', '901 Oak Lane', '234 Pine Street', get_random_number()),
(7, '2022-01-22 14:00:00', '234 Elm Street', '567 Oak Avenue', get_random_number()),
(8, '2022-01-30 16:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(3, '2022-01-01 18:00:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(5, '2022-01-15 10:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(2, '2022-01-26 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(1, '2022-01-05 16:00:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(4, '2022-01-15 10:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(6, '2022-01-30 12:00:00', '901 Oak Lane', '234 Pine Street', get_random_number()),
(2, '2022-01-20 14:00:00', '234 Elm Street', '567 Oak Avenue', get_random_number()),
(3, '2022-01-01 16:00:00', '789 Pine Road', '123 Maple Lane', get_random_number()),
(5, '2022-01-10 18:00:00', '345 Walnut Avenue', '678 Cedar Street', get_random_number()),
(1, '2022-01-15 10:00:00', '567 Elm Street', '890 Oak Avenue', get_random_number()),
(4, '2022-01-25 14:00:00', '789 Pine Road', '123 Maple Lane', get_random_number());
