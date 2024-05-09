WITH visits AS 
(
	SELECT pizzeria.name, COUNT(pizzeria.name), 'visits' AS action_type
	FROM person_visits
	JOIN pizzeria ON pizzeria.id=person_visits.pizzeria_id
	GROUP BY pizzeria.name
), orders AS
(
	SELECT pizzeria.name, COUNT(pizzeria.name), 'order' AS action_type
	FROM person_order
	JOIN menu ON menu.id=person_order.menu_id 
	JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
	GROUP BY pizzeria.name
)
(
SELECT *
FROM visits
ORDER BY visits.count DESC LIMIT 3
)
UNION ALL
(
SELECT *
FROM orders
ORDER BY orders.count DESC LIMIT 3
) 
ORDER BY action_type ASC, count DESC