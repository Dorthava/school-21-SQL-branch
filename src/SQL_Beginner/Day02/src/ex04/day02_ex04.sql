 SELECT menu.pizza_name, pizzeria.name AS pizzeria_name, menu.price
 FROM menu
 JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
 WHERE menu.pizza_name LIKE 'pepperoni pizza' OR menu.pizza_name LIKE 'mushroom pizza'
 ORDER BY pizza_name, pizzeria_name