WITH users AS (SELECT * FROM "user"),
balances AS (SELECT CASE WHEN users.name IS NULL THEN 'not defined' ELSE users.name END AS name, 
			 CASE WHEN users.lastname IS NULL THEN 'not defined' ELSE users.lastname END AS lastname, 
			 balance.type, SUM(balance.money) AS volume, balance.currency_id 
			 FROM balance
			 FULL JOIN users ON users.id = balance.user_id
			 GROUP BY users.name, users.lastname, balance.type, balance.currency_id), 
			 currencys AS (SELECT post_currency.id, currency.name AS currency_name,
						   currency.rate_to_usd AS last_rate_to_usd
						   FROM (SELECT currency.id, MAX(currency.updated) AS max_rate FROM currency
								 GROUP BY currency.id
								) AS post_currency JOIN currency ON post_currency.id=currency.id 
						   AND currency.updated=post_currency.max_rate)
							 
SELECT balances.name, balances.lastname, balances.type, balances.volume,
CASE WHEN currencys.currency_name IS NULL THEN 'not defined' ELSE currencys.currency_name END AS currency_name,
CASE WHEN currencys.last_rate_to_usd IS NULL THEN 1 ELSE currencys.last_rate_to_usd END AS last_rate_to_usd,
(CASE WHEN currencys.last_rate_to_usd IS NULL THEN 1 ELSE currencys.last_rate_to_usd END * balances.volume) AS total_volume_in_usd
FROM balances
FULL JOIN currencys ON currencys.id=balances.currency_id
ORDER BY balances.name DESC, balances.lastname ASC, balances.type ASC;
 
