CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date( IN pperson varchar DEFAULT 'Dmitriy', IN pprice numeric DEFAULT 500, IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (
	name varchar
	)
AS $$
BEGIN
RETURN QUERY
SELECT pizzeria.name FROM person_visits 
JOIN person_order ON person_order.person_id=person_visits.person_id
JOIN person ON person.id=person_order.person_id
JOIN menu ON person_order.id=menu.id
JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
WHERE person.name LIKE pperson AND menu.price<pprice AND pdate=person_visits.visit_date;
END;
$$ LANGUAGE plpgsql; 

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
