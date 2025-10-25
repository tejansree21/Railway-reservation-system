-- Create Database
CREATE DATABASE RailwayReservationSystem;
USE RailwayReservationSystem;

-- Create Tables
CREATE TABLE Train (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(100),
    source VARCHAR(100),
    destination VARCHAR(100),
    total_seats INT,
    available_seats INT
);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact_no VARCHAR(15)
);

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    train_id INT,
    seat_no INT,
    travel_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (train_id) REFERENCES Train(train_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(20),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);

-- Insert Sample Data
INSERT INTO Train (train_name, source, destination, total_seats, available_seats) VALUES
('Rajdhani Express', 'Delhi', 'Mumbai', 200, 200),
('Shatabdi Express', 'Delhi', 'Chandigarh', 150, 150),
('Duronto Express', 'Mumbai', 'Kolkata', 250, 250);

INSERT INTO Passenger (passenger_name, age, gender, contact_no) VALUES
('Amit Kumar', 28, 'Male', '9876543210'),
('Priya Sharma', 24, 'Female', '9876501234'),
('Rohit Singh', 35, 'Male', '9812312345');

-- Example Reservation
INSERT INTO Reservation (passenger_id, train_id, seat_no, travel_date, status) VALUES
(1, 1, 45, '2025-10-20', 'Confirmed'),
(2, 2, 12, '2025-10-22', 'Pending');

-- Example Payment
INSERT INTO Payment (reservation_id, amount, payment_date, payment_mode) VALUES
(1, 1200.00, '2025-10-12', 'Credit Card'),
(2, 800.00, '2025-10-12', 'UPI');

-- Example Queries
-- 1. View all reservations
SELECT * FROM Reservation;

-- 2. Check available trains between two cities
SELECT * FROM Train WHERE source='Delhi' AND destination='Mumbai';

-- 3. Get passenger details with reservation info
SELECT p.passenger_name, t.train_name, r.travel_date, r.status
FROM Reservation r
JOIN Passenger p ON r.passenger_id = p.passenger_id
JOIN Train t ON r.train_id = t.train_id;

-- 4. Update available seats after booking
UPDATE Train
SET available_seats = available_seats - 1
WHERE train_id = 1;
