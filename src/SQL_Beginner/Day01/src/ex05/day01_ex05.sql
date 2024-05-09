SELECT person.id AS "person.id",
person.name AS "person.name",
age, gender,
pizzeria.id AS "pizzeria.id",
pizzeria.name AS "pizzeria.name",
rating
FROM pizzeria
CROSS JOIN person
ORDER BY person.id ASC;