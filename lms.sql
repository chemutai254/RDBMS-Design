-- Creating Learning Management System
CREATE DATABASE LMS;

-- Accessing the database
USE lms;

-- Creating Tables 
CREATE TABLE semester(
SemesterId varchar(10) NOT NULL,
SemesterDescritpion varchar(100),
SemesterStartDate date,
SemesterEndDate date,
VacationStartDate date,
VacationEndDate date,
primary key (SemesterId)
);

CREATE TABLE categories(
CategoryId varchar(10) NOT NULL,
CategoryDescription varchar(100),
primary key (CategoryId)
);

CREATE TABLE courses(
CourseId varchar(10) NOT NULL,
CourseDescription varchar(100),
Abstract text(1000),
Bibliography text(1000),
primary key (CourseId)
);

CREATE TABLE teachers(
TeacherId varchar(10) NOT NULL,
TeacherName varchar(100),
Email varchar(100),
PhoneNo varchar(100),
primary key (TeacherId)
);

CREATE TABLE teachersPerCourse(
CourseId varchar(10),
SemesterId varchar(10),
TeacherId varchar(10),
foreign key (TeacherId) references teachers(TeacherId),
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId)
);

CREATE TABLE coursesPerSemester(
CourseId varchar(10),
SemesterId varchar(10),
CourseStartDate date,
CourseEndDate date,
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId)
);

CREATE TABLE classes (
CourseId varchar(10),
SemesterId varchar(10),
ClassNo int NOT NULL,
TeacherId varchar(10),
ClassTitle varchar(100),
StartTime time,
EndTime time,
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId),
primary key (ClassNo),
foreign key (TeacherId) references teachers(TeacherId)
);

CREATE TABLE students (
StudentId varchar(10) NOT NULL,
StudentName varchar(100),
Email varchar(100),
DoB date,
PhoneNo varchar(30),
primary key (StudentId)
);

CREATE TABLE attendance (
CourseId varchar(10),
SemesterId varchar(10),
ClassNo int,
StudentId varchar(10),
TimeActive time,
TimeIncative time,
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId),
foreign key (ClassNo) references classes(ClassNo),
foreign key (StudentId) references students(StudentId)
);

CREATE TABLE enrollments (
CourseId varchar(10),
SemesterId varchar(10),
StudentId varchar(10),
EnrollmentDate date,
Cancelled boolean,
CancellationReason varchar(100),
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId),
foreign key (StudentId) references students(StudentId)
);

CREATE TABLE tests (
CourseId varchar(10),
SemesterId varchar(10),
TestNo int NOT NULL,
TestDate date,
TestTime time,
Agenda text(1000),
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId),
primary key (TestNo)
);

CREATE TABLE testScores (
CourseId varchar(10),
SemesterId varchar(10),
TestNo int,
StudentId varchar(10),
Score decimal(5,2),
foreign key (CourseId) references courses(CourseId),
foreign key (SemesterId) references semester(SemesterId),
foreign key (TestNo) references tests(TestNo),
foreign key (StudentId) references students(StudentId)
);