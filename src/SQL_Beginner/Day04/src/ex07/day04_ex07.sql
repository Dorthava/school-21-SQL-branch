INSERT INTO person_visits
VALUES (
(SELECT MAX(id) + 1 FROM person_visits), 
(SELECT person.id FROM person WHERE person.name LIKE 'Dmitriy'),
(SELECT pizzeria.id FROM pizzeria JOIN menu ON menu.pizzeria_id=pizzeria.id 
WHERE menu.price < 800 AND pizzeria.name NOT LIKE 'Papa Johns' LIMIT 1),
'2022-01-08'
);