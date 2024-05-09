WITH address_information AS (
SELECT person.address, 
ROUND(MAX(person.age)-(CAST(MIN(person.age) AS DEC(12,1))/MAX(person.age)),2) AS formula,
ROUND(AVG(person.age),2) AS average
FROM person
GROUP BY person.address)
SELECT address_information.address, address_information.formula, address_information.average,
CASE
WHEN formula>average THEN 'true'
ELSE 'false'
END comparison
FROM address_information
ORDER BY address