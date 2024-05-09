 SELECT person.name
 FROM person_order
 JOIN person ON person.id=person_order.person_id
 JOIN menu ON person_order.menu_id=menu.id
 WHERE person.gender LIKE 'male' 
 AND (person.address LIKE 'Moscow' OR person.address LIKE 'Samara') 
 AND (menu.pizza_name LIKE 'pepperoni pizza' OR menu.pizza_name LIKE 'mushroom pizza')
 ORDER BY person.name DESC;