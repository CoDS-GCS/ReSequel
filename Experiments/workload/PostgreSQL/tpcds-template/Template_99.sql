SELECT count(*)
FROM store_sales,
     household_demographics,
     time_dim,
     store
WHERE ss_sold_time_sk = time_dim.t_time_sk
  AND ss_hdemo_sk = household_demographics.hd_demo_sk
  AND ss_store_sk = s_store_sk
  AND time_dim.t_hour = ###
  AND time_dim.t_minute >= ###
  AND household_demographics.hd_dep_count = ###
  AND store.s_store_name = &&&
ORDER BY count(*)
LIMIT ###;