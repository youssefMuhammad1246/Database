# Language School Management System

## Project Overview
The **Language School Management System** is a database project designed to manage the main operations of a language school. It organizes information about students, teachers, languages, educational levels, classes, registrations, and payments.

The system uses Microsoft SQL Server to store and manage data efficiently through relational database tables and constraints.

## Team Members
- Youssef Muhammad
- Adham Ebrahim
- Ezz Eldin Ahmed
- Baraa Hanafy
- Youssef Elkhatedb


## Database Structure

The database consists of the following 9 tables:

1. **TEACHERS** – Stores teacher information.
2. **TEACHER_PHONES** – Stores teachers' phone numbers.
3. **STUDENTS** – Stores student information.
4. **STUDENTS_PHONES** – Stores students' phone numbers.
5. **LANGUAGES** – Stores available languages.
6. **LEVELS** – Stores educational levels.
7. **CLASSES** – Stores class information.
8. **CLASS_STUDENTS** – Manages student enrollment in classes.
9. **PAYMENTS** – Stores student payment records.

## Database Files

The database uses four physical files:

- **Primary Data File (MDF):** Stores the main database data.
- **Secondary Data File (NDF):** Provides additional data storage.
- **Log File (LDF):** Stores transaction log information.
- **Additional Log File (LDF):** Provides an additional transaction log file.

File properties include:
- SIZE
- MAXSIZE
- FILEGROWTH

## Database Constraints

The project uses relational database constraints, including:

- Primary Key (PK)
- Foreign Key (FK)
- Unique (UNIQUE)
- Check (CHECK)
- Default (DEFAULT)
- NOT NULL

These constraints help maintain data integrity and consistency.

## Technologies Used
- Microsoft SQL Server
- SQL (Structured Query Language)
- SQL Server Management Studio (SSMS)
- GitHub

## Project Files

- `Create_Database_Files.sql` – Creates the database and its physical files.
- `First_Quiz.sql` – Contains the database schema and table definitions.
- `Diagrams/` – Contains the ERD and Mapping Diagram.

## How to Run

1. Open SQL Server Management Studio (SSMS).
2. Connect to your SQL Server instance.
3. Open and execute `Create_Database_Files.sql`.
4. Open and execute `First_Quiz.sql`.
5. Verify that the database and its nine tables have been created successfully.

---

**Project:** Language School Management System  
**Database Platform:** Microsoft SQL Server  
**Repository:** GitHub
