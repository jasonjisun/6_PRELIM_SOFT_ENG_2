Table Student {
  id int [pk] // Primary Key
  first_name varchar(50)
  last_name varchar(50)
  dob date // Date of Birth
  email varchar(100) [unique]
  phone varchar(15)
  address varchar(200)
}

Table Teacher {
  id int [pk] // Primary Key
  first_name varchar(50)
  last_name varchar(50)
  email varchar(100) [unique]
  phone varchar(15)
  department varchar(100)
}

Table Course {
  id int [pk] // Primary Key
  name varchar(100)
  code varchar(10) [unique] // Course Code like UCOS42
  credits int
  teacher_id int // Foreign key to Teacher table
}

Table Enrollment {
  id int [pk] // Primary Key
  student_id int // Foreign key to Student table
  course_id int // Foreign key to Course table
  enrollment_date date
}

Table Grade {
  id int [pk] // Primary Key
  enrollment_id int // Foreign key to Enrollment table
  grade float // average
  comments varchar(200)
}

Ref: Course.teacher_id > Teacher.id
Ref: Enrollment.student_id > Student.id
Ref: Enrollment.course_id > Course.id
Ref: Grade.enrollment_id > Enrollment.id

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 

-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(200)
);

-- Create the Teacher table
CREATE TABLE Teacher (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(100)
);

-- Create the Course table
CREATE TABLE Course (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    code VARCHAR(10) UNIQUE,
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(id)
);

-- Create the Enrollment table
CREATE TABLE Enrollment (
    id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (course_id) REFERENCES Course(id),
    UNIQUE (student_id, course_id)
);

-- Create the Grade table
CREATE TABLE Grade (
    id INT PRIMARY KEY,
    enrollment_id INT,
    grade FLOAT,
    comments VARCHAR(200),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(id)
);
