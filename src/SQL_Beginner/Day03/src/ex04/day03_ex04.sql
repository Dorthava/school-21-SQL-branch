WITH visits_male AS (
	SELECT pizzeria.name
	FROM person_order
	JOIN person ON person_order.person_id=person.id
	JOIN menu ON menu.id=person_order.menu_id
	JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
	WHERE person.gender LIKE 'male'
), visits_female AS (
	SELECT pizzeria.name
	FROM person_order
	JOIN person ON person_order.person_id=person.id
	JOIN menu ON menu.id=person_order.menu_id
	JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
	WHERE person.gender LIKE 'female'
)
	(SELECT visits_female.name AS pizzeria_name
	FROM visits_female
	EXCEPT 
	SELECT visits_male.name AS pizzeria_name
	FROM visits_male)
	UNION
	(SELECT visits_male.name AS pizzeria_name
	FROM visits_male
	EXCEPT 
	SELECT visits_female.name AS pizzeria_name
	FROM visits_female)