SELECT menu1.pizza_name, pizzeria2.name AS pizzeria_name_1, pizzeria1.name AS pizzeria_name_2, menu1.price
FROM menu AS menu1
INNER JOIN pizzeria AS pizzeria1 ON pizzeria1.id=menu1.pizzeria_id 
CROSS JOIN menu AS menu2
INNER JOIN pizzeria AS pizzeria2 ON pizzeria2.id=menu2.pizzeria_id 
WHERE menu1.price=menu2.price AND menu1.pizza_name LIKE menu2.pizza_name
AND pizzeria1.name NOT LIKE pizzeria2.name AND pizzeria1.name > pizzeria2.name
ORDER BY menu1.pizza_name
