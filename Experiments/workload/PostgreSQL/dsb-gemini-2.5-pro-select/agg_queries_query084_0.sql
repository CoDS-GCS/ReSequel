 
  
  
 
SELECT c.c_customer_id AS customer_id,
       coalesce(c.c_last_name, '') || ', ' || coalesce(c.c_first_name, '') AS customername
FROM customer c
JOIN customer_address ca ON c.c_current_addr_sk = ca.ca_address_sk
JOIN customer_demographics cd ON c.c_current_cdemo_sk = cd.cd_demo_sk
JOIN household_demographics hd ON c.c_current_hdemo_sk = hd.hd_demo_sk
JOIN income_band ib ON hd.hd_income_band_sk = ib.ib_income_band_sk
JOIN store_returns sr ON sr.sr_cdemo_sk = cd.cd_demo_sk
WHERE ca.ca_city = 'Hopewell'
  AND ib.ib_lower_bound >= 32287
  AND ib.ib_upper_bound <= 32287 + 50000
ORDER BY c_customer_id
LIMIT 100;