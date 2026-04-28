SELECT *
FROM
  (SELECT count(*) h8_30_to_9
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute >= ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s1,

  (SELECT count(*) h9_to_9_30
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute < ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s2,

  (SELECT count(*) h9_30_to_10
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute >= ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s3,

  (SELECT count(*) h10_to_10_30
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute < ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s4,

  (SELECT count(*) h10_30_to_11
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute >= ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s5,

  (SELECT count(*) h11_to_11_30
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute < ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s6,

  (SELECT count(*) h11_30_to_12
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute >= ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s7,

  (SELECT count(*) h12_to_12_30
   FROM store_sales,
        household_demographics,
        time_dim,
        store
   WHERE ss_sold_time_sk = time_dim.t_time_sk
     AND ss_hdemo_sk = household_demographics.hd_demo_sk
     AND ss_store_sk = s_store_sk
     AND time_dim.t_hour = ###
     AND time_dim.t_minute < ###
     AND ((household_demographics.hd_dep_count = ###
           AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###)
          OR (household_demographics.hd_dep_count = ###
              AND household_demographics.hd_vehicle_count<=###))
     AND store.s_store_name = &&&) s8 ;