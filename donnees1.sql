
--1. Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipe.
SELECT id,first_name,last_name from employee where employee.team_id is null;

