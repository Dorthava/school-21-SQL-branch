INSERT INTO person_order
VALUES (
	(SELECT MAX(person_order.id) + 1 FROM person_order),
	(SELECT person.id FROM person WHERE person.name LIKE 'Denis'),
	(SELECT menu.id FROM menu WHERE menu.pizza_name LIKE 'sicilian pizza'),
	'2022-02-24'
);
INSERT INTO person_order
VALUES (
	(SELECT MAX(person_order.id) + 1 FROM person_order),
	(SELECT person.id FROM person WHERE person.name LIKE 'Irina'),
	(SELECT menu.id FROM menu WHERE menu.pizza_name LIKE 'sicilian pizza'),
	'2022-02-24'
);