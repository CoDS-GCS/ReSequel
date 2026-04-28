SELECT min(c_customer_id),
       min(sr_ticket_number),
       min(sr_item_sk)
FROM customer,
     customer_address,
     customer_demographics,
     household_demographics,
     income_band,
     store_returns
WHERE ca_city = &&&_A
  AND c_current_addr_sk = ca_address_sk
  AND ib_lower_bound >= ###_A * ###_B
  AND ib_upper_bound <= ###_C * ###_D + ###_E
  AND ib_income_band_sk = hd_income_band_sk
  AND cd_demo_sk = c_current_cdemo_sk
  AND hd_demo_sk = c_current_hdemo_sk
  AND sr_cdemo_sk = cd_demo_sk ;