SELECT c_customer_id AS customer_id,
       coalesce(c_last_name, &&&_A) || &&&_B || coalesce(c_first_name, &&&_C) AS customername
FROM customer,
     customer_address,
     customer_demographics,
     household_demographics,
     income_band,
     store_returns
WHERE ca_city = &&&_D
  AND c_current_addr_sk = ca_address_sk
  AND ib_lower_bound >= ###_A
  AND ib_upper_bound <= ###_B + ###_C
  AND ib_income_band_sk = hd_income_band_sk
  AND cd_demo_sk = c_current_cdemo_sk
  AND hd_demo_sk = c_current_hdemo_sk
  AND sr_cdemo_sk = cd_demo_sk
ORDER BY c_customer_id
LIMIT ###_D;