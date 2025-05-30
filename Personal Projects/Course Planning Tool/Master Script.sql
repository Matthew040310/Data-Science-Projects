DROP DATABASE SMU_COURSES;
CREATE DATABASE SMU_COURSES;
USE SMU_COURSES;

# COURSE TABLE
CREATE TABLE COURSES (
CourseID VARCHAR(15) NOT NULL,
CourseName TEXT NOT NULL,
CONSTRAINT COURSES_PK PRIMARY KEY (CourseID));

LOAD DATA INFILE 'C:/wamp64/tmp/SMU Courses/Courses.csv'
INTO TABLE COURSES FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

# PRE-REQ TABLE
CREATE TABLE PRE_REQUISITIES(
CourseID VARCHAR(15) NOT NULL,
Pre_req TEXT,
Mutual_Exc TEXT);

LOAD DATA INFILE 'C:/wamp64/tmp/SMU Courses/Courses Pre-Requisties.csv'
INTO TABLE PRE_REQUISITIES FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

# AVAILABILITY TABLE
CREATE TABLE AVAILABILITY(
COURSEID VARCHAR(15) NOT NULL,
T1 VARCHAR(1),
T2 VARCHAR(1),
CONSTRAINT AVAILABILITY_PK PRIMARY KEY (COURSEID));

LOAD DATA INFILE 'C:/wamp64/tmp/SMU Courses/availability.csv'
INTO TABLE AVAILABILITY FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# IS_TRACK TABLE
CREATE TABLE IS_TRACKS(
COURSEID VARCHAR(15) NOT NULL,
TRACK VARCHAR(50) NOT NULL);

LOAD DATA INFILE 'C:/wamp64/tmp/SMU Courses/IS_Tracks.csv'
INTO TABLE IS_TRACKS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# SECOND_MAJOR TABLE
CREATE TABLE SECOND_MAJOR(
COURSEID VARCHAR(15) NOT NULL,
TRACK VARCHAR(50) NOT NULL,
MAJOR VARCHAR(50) NOT NULL,
MANDATORY VARCHAR(50) NOT NULL);

LOAD DATA INFILE 'C:/wamp64/tmp/SMU Courses/Second_Major.csv'
INTO TABLE SECOND_MAJOR FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# QUERY
SELECT P.COURSEID, C.COURSENAME, P.PRE_REQ, P.MUTUAL_EXC, A.T1, A.T2
FROM PRE_REQUISITIES AS P
INNER JOIN COURSES AS C
ON P.COURSEID = C.COURSEID
INNER JOIN AVAILABILITY AS A
ON C.COURSEID = A.COURSEID;