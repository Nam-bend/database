USE management_system;


-- chèn du lieu vao company
INSERT INTO  company (company_id ,company_name)VALUES 
(1,'company 1'),
(2,'company 2'),
(3,'company 3');

-- chen du liêu vao project 
INSERT INTO project (project_id,project_name,company_id)VALUES 
(1, 'project 1', 2),
(2, 'project 2', 1),
(3, 'project 3', 1),
(4, 'project 4', 3);

UPDATE project 
SET company_id =1 
WHERE project_name = 'project 1';

UPDATE project 
SET company_id =1 
WHERE project_name = 'project 2';

UPDATE project 
SET company_id =2
WHERE project_name = 'project 3';

-- Chèn dữ liệu vào bảng task
INSERT INTO task (task_name, time, project_id) VALUES
    ('Task A1', 10, 1),
    ('Task A2', 15, 1),
    ('Task B1', 12, 2),
    ('Task B2', 8, 2),
    ('Task C1', 20, 3);

   
  
INSERT INTO employee (employee_name) VALUES 
('Employee 1'), 
('Employee 2');

UPDATE task
SET employee_id = 1 
WHERE task_id IN (1, 2, 3);

UPDATE task 
SET employee_id = 2
WHERE task_id IN (4, 5);



