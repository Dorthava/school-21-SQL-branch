SELECT person.address,pizzeria.name,COUNT(pizzeria.name) AS count_of_orders
FROM pizzeria
JOIN menu ON menu.pizzeria_id=pizzeria.id
JOIN person_order ON person_order.menu_id=menu.id
JOIN person ON person.id=person_order.person_id
GROUP BY pizzeria.name, person.address
ORDER BY person.address, pizzeria.name