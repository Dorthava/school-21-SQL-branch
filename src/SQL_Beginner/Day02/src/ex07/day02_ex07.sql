 SELECT pizzeria.name AS pizzeria_name
 FROM (SELECT person.name, person_visits.pizzeria_id, person_visits.visit_date
	  FROM person_visits
	  JOIN person ON person.id=person_visits.person_id
	  WHERE person.name LIKE 'Dmitriy' AND person_visits.visit_date='2022-01-08') AS visit
	  JOIN menu ON visit.pizzeria_id=menu.pizzeria_id
	  JOIN pizzeria ON pizzeria.id=visit.pizzeria_id
	  WHERE menu.price < 800
 