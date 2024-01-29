USE management_system ;
-- a 
SELECT
    company.company_id,
    company.company_name,
    COUNT(project.project_id) AS total_projects
FROM
    company
LEFT JOIN
    project ON company.company_id = project.company_id
GROUP BY
    company.company_id, company.company_name;

 /*b. Viết câu truy vấn SQL để lấy thông tin về mỗi dự án, 
  *bao gồm tên dự án, tên công ty, và tổng số giờ ước tính 
  *để hoàn thành tất cả các task trong dự án.*/
   
SELECT p.project_id, p.project_name, c.company_name, SUM(t.time) AS total_hours
FROM project p
JOIN company c ON p.company_id = c.company_id
JOIN task t ON p.project_id = t.project_id
GROUP BY p.project_id, p.project_name, c.company_name;

/*c. Viết câu truy vấn SQL để lấy thông tin về tất cả các task
trong một dự án cụ thể, bao gồm tên task, số giờ dự kiến 
và thực tế để hoàn thành task. */ 


SELECT project.project_name ,task.task_name,task.time, task.time_completed 
FROM task
JOIN project ON task.project_id =project.project_id 
WHERE task.time_completed != 'null';


/* e. Tạo một câu truy vấn SQL để tính tổng số giờ đã dành cho
 mỗi nhân viên trên tất cả các task mà họ đã thực hiện. */



SELECT e.employee_id, e.employee_name, SUM(t.time) AS total_hours
FROM employee e
JOIN task t ON e.employee_id = t.employee_id
GROUP BY e.employee_id, e.employee_name;




 






