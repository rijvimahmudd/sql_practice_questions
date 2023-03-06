-- CREATE USER 'francesco'@'localhost' IDENTIFIED BY 'root';

USE shop;

CREATE TABLE
    student (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name varchar(255)
    );

INSERT INTO student VALUES (1,"ankit"), (2, "rahul");

SELECT * FROM student;

DROP TABLE IF EXISTS `student`;