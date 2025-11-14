
--1. Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.
SELECT id,first_name,last_name 
from employee 
where employee.team_id is null;

--2. Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé de leur vie.
SELECT e.id, e.first_name, e.last_name 
from employee e 
LEFT JOIN employee_leave l  
ON e.id = l.employee_id 
where l.employee_id is null;

--3. Afficher les congés de tel sorte qu’on voie l’id du congé, le début du congé, la fin du congé, le nom & prénom de l’employé qui prend congé et le nom de son équipe.
SELECT l.id,l.start_date,l.end_date,e.first_name,e.last_name,team.name 
FROM employee_leave l 
JOIN employee e ON  e.id = l.employee_id 
LEFT JOIN team ON e.team_id =team.id