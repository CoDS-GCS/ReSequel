SELECT c_last_name,
       c_first_name,
       c_salutation,
       c_preferred_cust_flag,
       ss_ticket_number,
       cnt
FROM
  (SELECT ss_ticket_number,
          ss_customer_sk,
          count(*) cnt
   FROM store_sales,
        date_dim,
        store,
        household_demographics
   WHERE store_sales.ss_sold_date_sk = date_dim.d_date_sk
     AND store_sales.ss_store_sk = store.s_store_sk
     AND store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
     AND (date_dim.d_dom BETWEEN ### AND ###
          OR date_dim.d_dom BETWEEN ### AND ###)
     AND (household_demographics.hd_buy_potential = &&&
          OR household_demographics.hd_buy_potential = &&&)
     AND household_demographics.hd_vehicle_count > ###
     AND (CASE
              WHEN household_demographics.hd_vehicle_count > ### THEN (household_demographics.hd_dep_count*^^^)/ household_demographics.hd_vehicle_count
              ELSE NULL
          END) > ^^^
     AND date_dim.d_year IN (###,
                             ###,
                             ###)
     AND store.s_county = &&&
   GROUP BY ss_ticket_number,
            ss_customer_sk) dn,
     customer
WHERE ss_customer_sk = c_customer_sk
  AND cnt BETWEEN ### AND ###
ORDER BY c_last_name,
         c_first_name,
         c_salutation,
         c_preferred_cust_flag DESC,
         ss_ticket_number;