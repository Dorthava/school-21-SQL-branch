 SELECT person.name
 FROM person_order
 JOIN person ON person.id=person_order.person_id
 JOIN menu ON person_order.menu_id=menu.id
 WHERE person.gender LIKE 'female' 
 AND (menu.pizza_name LIKE 'pepperoni pizza') AND person.name IN (SELECT person.name
 FROM person_order
 JOIN person ON person.id=person_order.person_id
 JOIN menu ON person_order.menu_id=menu.id
 WHERE person.gender LIKE 'female' AND (menu.pizza_name LIKE 'cheese pizza'))
 ORDER BY person.name ASC;