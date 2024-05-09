SELECT list.pizza_name, list.price, pizzeria.name AS pizzeria_name
FROM (SELECT menu.price, menu.pizzeria_id, menu.pizza_name FROM menu
WHERE NOT EXISTS 
	  (SELECT person_order.menu_id FROM person_order WHERE person_order.menu_id=menu.id)) AS list
JOIN pizzeria ON pizzeria.id=list.pizzeria_id
ORDER BY list.pizza_name, list.price