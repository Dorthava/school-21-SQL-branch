SELECT name,age
FROM person
WHERE address LIKE '%Kazan%' AND gender LIKE '%female%'
ORDER BY name ASC;