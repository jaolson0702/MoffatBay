DROP DATABASE IF EXISTS MoffatBay;
CREATE DATABASE MoffatBay;
USE MoffatBay;

CREATE TABLE Customers (
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(100) NOT NULL,
    password varchar(20) NOT NULL,
    CONSTRAINT PK_Customers PRIMARY KEY (id)
);

CREATE TABLE Rooms (
	id int NOT NULL,
    room_size varchar(20) NOT NULL,
    available boolean NOT NULL,
    CONSTRAINT PK_Rooms PRIMARY KEY (id)
);

CREATE TABLE Bookings (
	id int NOT NULL AUTO_INCREMENT,
    rooms_id int NOT NULL,
    customers_id int NOT NULL,
    guest_count int NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    CONSTRAINT PK_Bookings PRIMARY KEY (id),
    CONSTRAINT FK_Bookings_Rooms FOREIGN KEY (rooms_id) REFERENCES Rooms(id),
    CONSTRAINT FK_Bookings_Customers FOREIGN KEY (customers_id) REFERENCES Customers(id)
);