WITH cte_days(all_date) AS (SELECT all_days::date FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS all_days) 
SELECT all_date AS missing_date
FROM cte_days
FULL JOIN (SELECT * FROM person_visits WHERE person_id = 1 OR person_id = 2) AS days2
ON all_date = days2.visit_date
WHERE days2.visit_date IS NULL
ORDER BY all_date ASC;