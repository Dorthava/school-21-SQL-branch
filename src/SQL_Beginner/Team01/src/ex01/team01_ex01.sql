CREATE FUNCTION fnc_near_сrate_to_usd(pdate TIMESTAMP, pmoney INTEGER)
RETURNS NUMERIC AS
$BODY$
WITH d1 AS (SELECT CASE WHEN (SELECT MAX(updated)
    FROM currency
    WHERE pdate > updated AND pmoney = id) IS NULL THEN
     (SELECT MIN(updated)
    FROM currency
    WHERE pdate < updated AND pmoney = id) ELSE (SELECT MAX(updated)
    FROM currency
    WHERE pdate > updated AND pmoney = id) END AS dd1)
    SELECT MIN(rate_to_usd)
FROM currency c JOIN d1 ON pmoney = id AND d1.dd1 = c.updated
WHERE updated = d1.dd1;
$BODY$
LANGUAGE sql;

WITH balances AS (SELECT CASE WHEN u.name IS NULL THEN 'not defined' ELSE u.name END AS name,
    CASE WHEN u.lastname IS NULL THEN 'not defined' ELSE u.lastname END AS lastname,
    b.currency_id, b.updated, b.money, c.name AS currency_name
	FROM balance b FULL JOIN "user" u on u.id = b.user_id
	JOIN currency c on b.currency_id = c.id)
SELECT name, lastname , currency_name,
       money * fnc_near_сrate_to_usd(updated, currency_id) AS currency_in_usd
FROM balances
GROUP BY name, lastname, currency_name, money, updated, currency_id
ORDER BY 1 DESC, 2, 3;
