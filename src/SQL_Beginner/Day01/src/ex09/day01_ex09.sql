SELECT name
FROM pizzeria
WHERE (id NOT IN (SELECT pizzeria_id
				 FROM person_visits)) OR (NOT EXISTS (SELECT * FROM person_visits WHERE pizzeria_id=pizzeria.id) )
