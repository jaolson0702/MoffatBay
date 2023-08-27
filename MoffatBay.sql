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

INSERT INTO rooms (id, room_size, available)
VALUES  (101, "double full beds", TRUE),
        (102, "queen bed", TRUE),
        (103, "double queen beds", TRUE),
        (104, "king bed", TRUE),
        (105, "double full beds", TRUE);

insert into Customers (id,first_name, last_name, email, phone, password)
VALUES  (1, "Anh", "Vo", "bellevueuni1@gmail.com", "402-717-8900","$ummeR2023"),
        (2, "Jared", "Olsen", "bellevueuni2@gmail.com", "402-717-8999","$ummeR2024"),
        (3, "Charlene", "Centeno", "bellevueuni3@gmail.com", "402-717-4545","$ummeR2025"),
        (4, "Bryce", "Kellas", "bellevueuni4@gmail.com", "402-717-8787","$ummeR2026");
        
INSERT INTO bookings (guest_count, check_in, check_out, rooms_id, customers_id)
VALUES  (5, '2024-1-1', '2024-2-1', 103, 4),
        (2, '2024-10-29', '2024-10-31', 104, 2),
        (3, '2024-9-13', '2024-9-13', 101, 1);