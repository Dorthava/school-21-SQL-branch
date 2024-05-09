CREATE VIEW v_persons_female
AS SELECT * FROM person WHERE person.gender LIKE 'female';

CREATE VIEW v_persons_male
AS SELECT * FROM person WHERE person.gender LIKE 'male';