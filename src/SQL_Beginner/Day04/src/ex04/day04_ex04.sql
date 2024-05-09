CREATE VIEW v_symmetric_union AS
(WITH r AS (SELECT * FROM person_visits WHERE person_visits.visit_date = '2022-01-02'),
s AS (SELECT * FROM person_visits WHERE person_visits.visit_date = '2022-01-06')
(SELECT r.person_id
FROM r
EXCEPT
SELECT s.person_id
FROM s)
UNION
(SELECT s.person_id
FROM s
EXCEPT
SELECT r.person_id
FROM r)
ORDER BY person_id ASC)
