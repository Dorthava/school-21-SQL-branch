INSERT INTO person_order
SELECT (SELECT MAX(id)+i AS id FROM person_order), i AS person_id,
(SELECT menu.id FROM menu WHERE menu.pizza_name LIKE 'greek pizza') AS menu_id,
'2022-02-25'
FROM generate_series(1,9) AS t(i)