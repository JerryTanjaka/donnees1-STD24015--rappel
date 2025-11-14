
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
