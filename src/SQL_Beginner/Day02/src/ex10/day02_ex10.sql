SELECT person.name AS person_name1, person2.name AS person_name2, person.address AS common_address
FROM (SELECT * FROM person) AS person2
CROSS JOIN person
WHERE person.name NOT LIKE person2.name AND person.address LIKE person2.address AND person2.id < person.id
ORDER BY person_name1, person_name2, common_address