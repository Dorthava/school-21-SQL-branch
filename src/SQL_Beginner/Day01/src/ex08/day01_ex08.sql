SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information
FROM (SELECT person.id AS person_id, name, age FROM person)
NATURAL JOIN person_order
ORDER BY order_date ASC, person_information ASC;
