CREATE SCHEMA marscamp;

CREATE TABLE users (
	registration_no VARCHAR(10) NOT NULL,
	phone_no VARCHAR(13) NOT NULL,
    email VARCHAR(100) NOT NULL,
    first_and_last_name VARCHAR(100) NOT NULL,
    user_type VARCHAR(7) NOT NULL,
    PRIMARY KEY (registration_no)
);

CREATE TABLE courses (
	course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(100) NOT NULL,
    course_desc VARCHAR(300) NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE student (
	user_id VARCHAR(10) NOT NULL,
	course_id INT NOT NULL,
    CONSTRAINT fk_stud_user FOREIGN KEY (user_id) REFERENCES users(registration_no) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_stud_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE instructor (
	approval BOOLEAN NOT NULL,
	user_id VARCHAR(10) NOT NULL,
	course_id INT NOT NULL,
    CONSTRAINT fk_inst_user FOREIGN KEY (user_id) REFERENCES users(registration_no) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_inst_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE feedback (
	feedback_id INT NOT NULL AUTO_INCREMENT,
    date_and_time DATETIME NOT NULL DEFAULT NOW(),
    content VARCHAR(10000) NOT NULL,
	user_id VARCHAR(10) NOT NULL,
	course_id INT NOT NULL,
    CONSTRAINT fk_fdbk_user FOREIGN KEY (user_id) REFERENCES users(registration_no) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_fdbk_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (feedback_id)
);

CREATE TABLE course_content (
	content_id INT NOT NULL AUTO_INCREMENT,
    date_and_time DATETIME NOT NULL DEFAULT NOW(),
    content VARCHAR(10000) NOT NULL,
	user_id VARCHAR(10) NOT NULL,
	course_id INT NOT NULL,
    CONSTRAINT fk_crcn_user FOREIGN KEY (user_id) REFERENCES users(registration_no) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_crcn_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (content_id)
);

CREATE TABLE questions (
	question_id INT NOT NULL AUTO_INCREMENT,
    course_id INT NOT NULL,
    content_id INT NOT NULL,
    question VARCHAR (500) NOT NULL,
    choices VARCHAR (1000) NOT NULL,
    CONSTRAINT fk_que_content FOREIGN KEY (content_id) REFERENCES course_content(content_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_que_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(question_id)
);

ALTER TABLE student ADD student_id INT NOT NULL;
ALTER TABLE student ADD PRIMARY KEY (student_id);
ALTER TABLE student
MODIFY COLUMN student_id INT NOT NULL AUTO_INCREMENT;
ALTER TABLE instructor ADD faculty_id INT NOT NULL;
ALTER TABLE instructor ADD PRIMARY KEY (faculty_id);
ALTER TABLE instructor
MODIFY COLUMN faculty_id INT NOT NULL AUTO_INCREMENT;
ALTER TABLE instructor
MODIFY COLUMN course_id INT;
ALTER TABLE users MODIFY COLUMN pwd VARCHAR(100) NOT NULL;
ALTER TABLE student MODIFY COLUMN course_id INT;
ALTER TABLE users ADD CONSTRAINT email_const UNIQUE (email);
ALTER TABLE student ADD CONSTRAINT student_const UNIQUE (user_id, course_id);
ALTER TABLE instructor DROP FOREIGN KEY fk_inst_course;
ALTER TABLE instructor ADD FOREIGN KEY (course_id) REFERENCES courses (course_id) ON DELETE SET NULL;
ALTER TABLE courses ADD difficulty VARCHAR(30) NOT NULL;
ALTER TABLE course_content ADD content_type VARCHAR(15) NOT NULL;
ALTER TABLE course_content ADD title VARCHAR(50) NOT NULL;

SELECT LAST_INSERT_ID(content_id) From course_content;

DESCRIBE users;
DESCRIBE courses;
DESCRIBE student;
DESCRIBE instructor;
DESCRIBE feedback;
DESCRIBE course_content;

SELECT * FROM users;
SELECT * FROM courses;
SELECT * FROM student;
SELECT * FROM instructor;
SELECT * FROM feedback;
SELECT * FROM course_content;