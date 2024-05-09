WITH man_visits AS (
	SELECT pizzeria.name
	FROM person_visits
	JOIN person ON person_visits.person_id=person.id
	JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
	WHERE person.gender LIKE 'male'
	EXCEPT ALL
	SELECT pizzeria.name
	FROM person_visits
	JOIN person ON person_visits.person_id=person.id
	JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
	WHERE person.gender LIKE 'female'
), female_visits AS (
	SELECT pizzeria.name
	FROM person_visits
	JOIN person ON person_visits.person_id=person.id
	JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
	WHERE person.gender LIKE 'female'
	EXCEPT ALL
	SELECT pizzeria.name
	FROM person_visits
	JOIN person ON person_visits.person_id=person.id
	JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
	WHERE person.gender LIKE 'male'
)
SELECT man_visits.name AS pizzeria_name
FROM man_visits
UNION ALL
SELECT female_visits.name AS pizzeria_name
FROM female_visits
ORDER BY pizzeria_name ASC;