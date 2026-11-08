CREATE DATABASE language_School;
USE language_School;

CREATE TABLE TEACHERS(
    Teacher_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Hire_Date DATE DEFAULT GETDATE()
);


CREATE TABLE LANGUAGES(
    Language_ID INT PRIMARY KEY,
    Language_Name VARCHAR(50) NOT NULL,
    Description VARCHAR(50)
);

CREATE TABLE STUDENTS(
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Registration_Date DATE NOT NULL,
    Date_of_Birth DATE NOT NULL,
    CONSTRAINT check_date_of_birth CHECK (Date_of_Birth >= '2005-01-01')
);

CREATE TABLE LEVELS(
    Level_ID INT PRIMARY KEY,
    Level_Name VARCHAR(50) NOT NULL,
    Level_Number INT NOT NULL,
    Language_ID INT NOT NULL,
    CONSTRAINT level_language_fk FOREIGN KEY (Language_ID) REFERENCES LANGUAGES(Language_ID)
);

CREATE TABLE TEACHER_PHONES(
    Teacher_ID INT NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    CONSTRAINT teacher_phone_pk PRIMARY KEY (Teacher_ID , Phone),
    CONSTRAINT teacher_phone_fk FOREIGN KEY (Teacher_ID) REFERENCES TEACHERS(Teacher_ID)
);

CREATE TABLE STUDENTS_PHONES(
    Student_ID INT NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    CONSTRAINT student_phone_pk PRIMARY KEY(Student_ID , Phone),
    CONSTRAINT student_phone_fk FOREIGN KEY (Student_ID) REFERENCES STUDENTS(Student_ID)
);

CREATE TABLE CLASSES(
    Class_ID INT PRIMARY KEY,
    Class_Code VARCHAR(10) NOT NULL,
    Capacity INT NOT NULL,
    CONSTRAINT check_capacity CHECK (Capacity>=1),
    Teacher_ID INT NOT NULL,
    CONSTRAINT class_teacher_fk FOREIGN KEY (Teacher_ID) REFERENCES TEACHERS(Teacher_ID),
    Level_ID INT NOT NULL,
    CONSTRAINT class_level_fk FOREIGN KEY (Level_ID) REFERENCES LEVELS(Level_ID)
);

CREATE TABLE CLASS_STUDENTS(
    Class_ID INT NOT NULL,
    Student_ID INT NOT NULL,
    CONSTRAINT class_student_pk PRIMARY KEY(Class_ID , Student_ID),
    CONSTRAINT class_fk FOREIGN KEY(Class_ID) REFERENCES CLASSES(Class_ID),
    CONSTRAINT student_fk FOREIGN KEY(Student_ID) REFERENCES STUDENTS(Student_ID)
);

CREATE TABLE PAYMENTS(
    Payment_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    CONSTRAINT payment_student_fk FOREIGN KEY(Student_ID) REFERENCES STUDENTS(Student_ID),
    Amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT check_amount CHECK (Amount>0),
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    Payment_Status VARCHAR(50) DEFAULT 'Unpaid'
);