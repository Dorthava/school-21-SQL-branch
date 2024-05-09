SELECT person.name, count_of_visits
FROM person
JOIN (
	SELECT person_visits.person_id, COUNT(person_visits.person_id) AS count_of_visits
	FROM person_visits
	GROUP BY person_visits.person_id
) AS visits ON visits.person_id=person.id AND count_of_visits>3;
