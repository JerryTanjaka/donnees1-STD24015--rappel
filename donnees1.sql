
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

--4. Affichez  le nombre d’employés par contract_type, vous devez afficher le type de contrat, et le nombre d’employés associés.
SELECT count(*) as total_employee ,e.contract_type 
FROM employee e 
GROUP BY e.contract_type;


--5. Afficher le nombre d’employés en congé aujourd'hui. La période de congé s'étend de start_date inclus jusqu’à end_date inclus.
SELECT COUNT(DISTINCT e.id) AS employees_on_leave
FROM employee e
JOIN employee_leave l ON l.employee_id = e.id
WHERE CURRENT_DATE BETWEEN l.start_date AND l.end_date;


--6. Afficher l’id, le nom, le prénom de tous les employés + le nom de leur équipe qui sont en congé aujourd’hui. Pour rappel, la end_date est incluse dans le congé, l’employé ne revient que le lendemain.
SELECT e.id, e.first_name,e.last_name, team.name 
FROM employee e 
LEFT JOIN team on e.team_id = team.id 
JOIN employee_leave l ON l.employee_id = e.id
WHERE CURRENT_DATE BETWEEN l.start_date AND l.end_date; 
