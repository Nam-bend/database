CREATE DATABASE management_system;
USE management_system;

/* mỗi cty có thể có nhiều project , mỗi project có thể có nhiều task */

CREATE TABLE company (
company_id int PRIMARY KEY ,
company_name varchar(50)
);


CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE  TABLE task (
task_id int ,
task_name varchar(50),
time date ,
project_id int ,
FOREIGN KEY (project_id) REFERENCES project(project_id) 
);

-- Bảng employee
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50)
);

ALTER TABLE task
ADD COLUMN employee_id INT,
ADD CONSTRAINT 
    FOREIGN KEY (employee_id)
    REFERENCES employee(employee_id);
