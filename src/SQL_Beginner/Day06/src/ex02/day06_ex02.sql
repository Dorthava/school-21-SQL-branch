SELECT person.name, menu.pizza_name, menu.price,
 CAST(menu.price-(menu.price*(person_discounts.discount/100)) AS numeric(5,2)) AS discount_price,
pizzeria.name AS pizzeria_name
FROM person_order 
JOIN person ON person.id=person_order.person_id
JOIN menu ON menu.id=person_order.menu_id
JOIN person_discounts ON person_discounts.person_id=person_order.person_id AND person_discounts.pizzeria_id=menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
ORDER BY person.name, pizza_name;
