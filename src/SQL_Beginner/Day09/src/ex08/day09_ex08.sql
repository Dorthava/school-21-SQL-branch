CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (
number integer
)
AS $$
WITH RECURSIVE foo(number1, number2) AS (
	SELECT 0, 1
	UNION ALL
	SELECT GREATEST(number1, number2), number1 + number2
	FROM foo
	WHERE number2 < pstop
)
SELECT number1 FROM foo
$$ LANGUAGE sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
