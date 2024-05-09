WITH pizzeria_order AS (
	SELECT pizzeria.name
	FROM person_order
	JOIN person ON person_order.person_id=person.id
	JOIN menu ON menu.id=person_order.menu_id
	JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
	WHERE person.name LIKE 'Andrey'
), pizzeria_visit AS (
	SELECT pizzeria.name
	FROM person_visits
	JOIN person ON person_visits.person_id=person.id
	JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
	WHERE person.name LIKE 'Andrey'
)
	SELECT pizzeria_visit.name AS pizzeria_name FROM pizzeria_visit
	EXCEPT
	SELECT pizzeria_order.name AS pizzeria_name FROM pizzeria_order



