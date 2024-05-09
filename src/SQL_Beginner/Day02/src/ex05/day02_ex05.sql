 SELECT information.name
 FROM (SELECT person.name, person.age FROM person WHERE person.age >= 25) AS information
 ORDER BY information.name ASC;
 