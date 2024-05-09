SELECT person.name
FROM person
WHERE person.id IN (SELECT person_order.person_id
	 FROM person_order)
	 ORDER BY person.name;
