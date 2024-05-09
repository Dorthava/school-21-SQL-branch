WITH pm AS (SELECT person_id, pizzeria_id, count(pizzeria_id)
FROM person_order
JOIN menu ON menu.id=person_order.menu_id
GROUP BY person_id, menu.pizzeria_id)
INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
	SELECT ROW_NUMBER() OVER () AS id, person_id,pizzeria_id, CASE  
	 WHEN pm.count=1 THEN 10.5
	 WHEN pm.count=2 THEN 22
	 WHEN pm.count=3 THEN 30
	 END AS discount
	 FROM pm
	 ORDER BY person_id;
