SELECT COALESCE(person.name, '-') AS person_name,
date.visit_date,
COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (SELECT * FROM person_visits WHERE person_visits.visit_date >= '2022.01.01' 
	  AND person_visits.visit_date <= '2022.01.03') AS date
FULL JOIN pizzeria ON pizzeria.id=date.pizzeria_id
FULL JOIN person ON person.id=date.person_id
ORDER BY person_name, date.visit_date, pizzeria_name