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
