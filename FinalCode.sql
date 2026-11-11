USE master;
GO

CREATE DATABASE language_School

ON PRIMARY
(
    NAME = language_School_Data,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\language_School.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
),
(
    NAME = language_School_Secondary,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\language_School_Secondary.ndf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)

LOG ON
(
    NAME = language_School_Log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\language_School_Log.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
),
(
    NAME = language_School_Log2,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\language_School_Log2.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);
GO


USE language_School;
GO

CREATE TABLE TEACHERS(
    Teacher_ID INT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Hire_Date DATE DEFAULT GETDATE(),

    CONSTRAINT teachers_id_pk PRIMARY KEY(Teacher_ID)
);


CREATE TABLE LANGUAGES(
    Language_ID INT,
    Language_Name VARCHAR(50) NOT NULL,
    Description VARCHAR(50),

    CONSTRAINT language_id_pk PRIMARY KEY(Language_ID)
);


CREATE TABLE STUDENTS(
    Student_ID INT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Registration_Date DATE NOT NULL,
    Date_of_Birth DATE NOT NULL,

    CONSTRAINT students_id_pk PRIMARY KEY(Student_ID),
    CONSTRAINT check_date_of_birth CHECK (Date_of_Birth >= '2005-01-01')
);


CREATE TABLE LEVELS(
    Level_ID INT,
    Level_Name VARCHAR(50) NOT NULL,
    Level_Number INT NOT NULL,
    Language_ID INT NOT NULL,

    CONSTRAINT level_id PRIMARY KEY(Level_ID),
    CONSTRAINT language_id_fk FOREIGN KEY (Language_ID) REFERENCES LANGUAGES(Language_ID)
);


CREATE TABLE TEACHER_PHONES(
    Teacher_ID INT NOT NULL,
    Phone VARCHAR(20) NOT NULL,

    CONSTRAINT teacher_phone_pk PRIMARY KEY(Teacher_ID, Phone),
    CONSTRAINT teacher_phone_fk FOREIGN KEY (Teacher_ID) REFERENCES TEACHERS(Teacher_ID)
);


CREATE TABLE STUDENTS_PHONES(
    Student_ID INT NOT NULL,
    Phone VARCHAR(20) NOT NULL,

    CONSTRAINT student_phone_pk PRIMARY KEY(Student_ID, Phone),
    CONSTRAINT student_phone_fk FOREIGN KEY (Student_ID) REFERENCES STUDENTS(Student_ID)
);


CREATE TABLE CLASSES(
    Class_ID INT,
    Class_Code VARCHAR(10) NOT NULL,
    Capacity INT NOT NULL,
    Teacher_ID INT NOT NULL,
    Level_ID INT NOT NULL,
    
    CONSTRAINT class_id PRIMARY KEY(Class_ID),
    CONSTRAINT check_capacity CHECK (Capacity >= 1),
    CONSTRAINT class_teacher_fk FOREIGN KEY (Teacher_ID) REFERENCES TEACHERS(Teacher_ID),
    CONSTRAINT class_level_fk FOREIGN KEY (Level_ID) REFERENCES LEVELS(Level_ID)

);


CREATE TABLE CLASS_STUDENTS(
    Class_ID INT NOT NULL,
    Student_ID INT NOT NULL,

    CONSTRAINT class_student_pk PRIMARY KEY(Class_ID, Student_ID),
    CONSTRAINT class_fk FOREIGN KEY (Class_ID) REFERENCES CLASSES(Class_ID),
    CONSTRAINT student_fk FOREIGN KEY (Student_ID) REFERENCES STUDENTS(Student_ID)
);


CREATE TABLE PAYMENTS(
    Payment_ID INT,
    Student_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    Payment_Status VARCHAR(50) DEFAULT 'Unpaid'

    CONSTRAINT payment_id PRIMARY KEY(Payment_ID),
    CONSTRAINT payment_student_fk FOREIGN KEY(Student_ID) REFERENCES STUDENTS(Student_ID),
    CONSTRAINT check_amount CHECK (Amount > 0)
);
GO
