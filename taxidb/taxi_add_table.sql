CREATE TABLE IF NOT EXISTS Car (
    ID_car INTEGER DEFAULT NEXTVAL('car_id_seq') PRIMARY KEY,
    Brand VARCHAR(64) NOT NULL,
    Model VARCHAR(64) NOT NULL,
    State_number VARCHAR(9) NOT NULL UNIQUE CHECK (REGEXP_LIKE(State_number, '^[A-Za-z]{3}\d{3}$')),
    Color VARCHAR(32) NOT NULL,
    Seats INT NOT NULL,
    Child_seat BOOLEAN,
    Year_manufactured VARCHAR(4) NOT NULL CHECK (REGEXP_LIKE(Year_manufactured, '^(19[0-9][0-9]|2[0-9][0-9][0-9])$')),
    car_type VARCHAR(16) NOT NULL,
    car_class VARCHAR(16) NOT NULL,
    Gearbox VARCHAR(16) NOT NULL CHECK (Gearbox IN ('Automatic', 'Manual')),
    Date_t_service DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Client (
    ID_client INT DEFAULT NEXTVAL('client_id_seq') PRIMARY KEY,
    client_name VARCHAR(512) NOT NULL,
    Registration_date DATE,
    Phone_number VARCHAR(20) NOT NULL CHECK(REGEXP_LIKE(Phone_number, '^\+\d{1}\(\d{3}\)\d{7}$')),
    Mail VARCHAR(256) CHECK(REGEXP_LIKE(Mail, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

CREATE TABLE IF NOT EXISTS Account (
    ID_Client INTEGER REFERENCES Client(ID_client),
    Balance INTEGER
);

CREATE TABLE IF NOT EXISTS Driver (
    ID_driver INT DEFAULT NEXTVAL('driver_id_seq') PRIMARY KEY,
    driver_name VARCHAR(512) NOT NULL,
    Experience_date DATE NOT NULL,
    Registration_date DATE NOT NULL,
    CONSTRAINT check_experience CHECK (DATE_PART('year', Registration_date) - DATE_PART('year', Experience_date) >= 3),
    Phone_number VARCHAR(20) NOT NULL CHECK (REGEXP_LIKE(Phone_number, '^\+\d{1}\(\d{3}\)\d{7}$')),
    Mail VARCHAR(256) CHECK (REGEXP_LIKE(Mail, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

CREATE TABLE IF NOT EXISTS Change (
    ID_change INT DEFAULT NEXTVAL('change_id_seq') PRIMARY KEY,
    ID_driver INT REFERENCES Driver(ID_driver),
    ID_car INT REFERENCES Car(ID_car),
  	CONSTRAINT change_unique_key UNIQUE (ID_driver, ID_car),
    Date_open TIMESTAMP NOT NULL,
    Date_close TIMESTAMP,
    Cash_sum NUMERIC,
    Payment NUMERIC,
    Sent_payment BOOLEAN
);

CREATE TABLE IF NOT EXISTS Ord_client (
    ID_Order INT DEFAULT NEXTVAL('order_id_seq') PRIMARY KEY,
    ID_Client INT REFERENCES Client(ID_client),
    Date_open TIMESTAMP,
    Adress_departure TEXT,
    Adress_arrival TEXT,
  	order_cost INT
);

CREATE TABLE IF NOT EXISTS Ord_driver (
    ID_Order INT REFERENCES Ord_client(ID_order),
    ID_Client INT REFERENCES Client(ID_client),
    ID_Driver INT,
    ID_Car INT,
    Date_close TIMESTAMP,
    order_cost INTEGER,
    CONSTRAINT ord_driver_fk FOREIGN KEY (ID_Driver, ID_Car) REFERENCES Change(ID_driver, ID_car)
);
