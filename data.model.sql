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
