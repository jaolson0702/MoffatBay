DROP DATABASE IF EXISTS MoffatBay;
CREATE DATABASE MoffatBay;
USE MoffatBay;

CREATE TABLE Customers (
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(100) NOT NULL,
    password varchar(200) NOT NULL,
    CONSTRAINT PK_Customers PRIMARY KEY (id)
);

CREATE TABLE Rooms (
	id int NOT NULL,
    room_size varchar(20) NOT NULL,
    available boolean NOT NULL,
    price decimal(5,2) NOT NULL,
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

INSERT INTO rooms (id, room_size, available, price)
VALUES  (101, 'double full beds', TRUE, '115.50'),
        (102, 'queen bed', TRUE, '120.75'),
        (103, 'double queen beds', TRUE, '131.25'),
        (104, 'king bed', TRUE, '157.50'),
        (105, 'double full beds', TRUE, '115.50');

insert into Customers (first_name, last_name, email, phone, password)
VALUES  ('Anh', 'Vo', 'bellevueuni1@gmail.com', '402-717-8900','1000:5fa303aa461acad341889095aa92ea3b:44e89a49624ebdc3a438b493e84a0945031ffbe20e542476158d0ee19b4fcf48e053057ade72f0ae729064e5d9ef8fc59f73aa9f4209285d9ebbc5eca38916de'),
        ('Jared', 'Olsen', 'bellevueuni2@gmail.com', '402-717-8999','1000:b4a0781405ad28e01114aab7e35ebac8:630f89985ec956b253e5970d47941d5c2bf17b3d87230a6daf1abb4b1063abbd3f65a1c3de1d81f4a52bbb6439976093ba6a2067d73743127696c8162a59ce29'),
        ('Charlene', 'Centeno', 'bellevueuni3@gmail.com', '402-717-4545','1000:6514f954626238cca8a290dd202a0322:afb2e53c9223ceae00b20b13071d7b4286d1b2bbc0695bacfd1b71e7e3801b540afd95193f8fc16bab9605ddd3e4e12317bf1a889970ff363f8c47e8ab49d5ed'),
        ('Bryce', 'Kellas', 'bellevueuni4@gmail.com', '402-717-8787','1000:200caa25a3eb896c0b036d27c1476703:71accecf484db088b70b072b7bb6791cb82107349ab9990ef3096c0a872be105a79d822cc18e228f101fa717c376ac9f54d214eeb975028ee92e1f1697ad7d3d');
        
INSERT INTO bookings (guest_count, check_in, check_out, rooms_id, customers_id)
VALUES  (5, '2024-1-1', '2024-2-1', 103, 4),
        (2, '2024-10-29', '2024-10-31', 104, 2),
        (3, '2024-9-13', '2024-9-13', 101, 1);