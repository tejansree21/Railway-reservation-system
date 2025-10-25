# 🚆 Railway Reservation System (SQL Project)

## 📘 Overview
The **Railway Reservation System** is a SQL-based project that simulates a simple database structure for booking, managing, and tracking railway reservations.  
It handles **passenger details**, **train information**, **reservations**, and **payments** — providing a clear relational model of how real-world railway databases function.

---

## 🏗️ Database Schema

### 🗃️ Tables:
1. **Train** – Stores train details including source, destination, and seat availability.  
2. **Passenger** – Holds information about passengers such as name, age, and contact number.  
3. **Reservation** – Links passengers with trains and tracks seat number, date, and booking status.  
4. **Payment** – Records payment details for confirmed bookings.

---

## 🧩 Features
- Add, update, and delete passenger records  
- Book train tickets with seat tracking  
- Handle multiple payment methods  
- Retrieve and analyze passenger and booking data  
- Query trains based on route availability  

---

## 🗂️ Example Queries
- **Check available trains:**
  ```sql
  SELECT * FROM Train WHERE source='Delhi' AND destination='Mumbai';



How to Run

Open your SQL environment (e.g., MySQL, SQL Server, SQLite).

Copy and paste the contents of railway_reservation_system.sql.

Execute the script step-by-step.

Run queries to interact with the database.

