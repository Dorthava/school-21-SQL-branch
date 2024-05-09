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
SELECT pizzeria.name, COALESCE(orders.count, 0)+COALESCE(visits.count, 0) AS total_count
FROM pizzeria
FULL JOIN visits ON visits.name=pizzeria.name 
FULL JOIN orders ON orders.name=pizzeria.name
ORDER BY total_count DESC, pizzeria.name ASC;
