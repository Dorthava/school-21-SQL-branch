INSERT INTO person_visits
VALUES (
	(SELECT MAX(person_visits.id) + 1 FROM person_visits),
	(SELECT person.id FROM person WHERE person.name LIKE 'Denis'),
	(SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name LIKE 'Dominos'),
	'2022-02-24'
);
INSERT INTO person_visits
VALUES (
	(SELECT MAX(person_visits.id) + 1 FROM person_visits),
	(SELECT person.id FROM person WHERE person.name LIKE 'Irina'),
	(SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name LIKE 'Dominos'),
	'2022-02-24'
);