CREATE INDEX idx_person_name ON person(UPPER(name));
SET enable_seqscan TO OFF;
EXPLAIN ANALYSE
SELECT person.name FROM person
WHERE UPPER(name) LIKE 'Kate';