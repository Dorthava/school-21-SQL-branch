 SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
 FROM (SELECT * FROM person_order JOIN person ON person.id=person_order.person_id
	  WHERE person.name LIKE 'Denis' OR person.name LIKE 'Anna') AS person_inform
	  JOIN menu ON menu.id=person_inform.menu_id 
	  JOIN pizzeria ON pizzeria.id=menu.pizzeria_id 
	  ORDER BY pizza_name, pizzeria_name
 