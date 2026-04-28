SELECT SUM (ss_quantity)
FROM store_sales,
     store,
     customer_demographics,
     customer_address,
     date_dim
WHERE s_store_sk = ss_store_sk
  AND ss_sold_date_sk = d_date_sk
  AND d_year = ###
  AND ((cd_demo_sk = ss_cdemo_sk
        AND cd_marital_status = &&&
        AND cd_education_status = &&&
        AND ss_sales_price BETWEEN ^^^ AND ^^^)
       OR (cd_demo_sk = ss_cdemo_sk
           AND cd_marital_status = &&&
           AND cd_education_status = &&&
           AND ss_sales_price BETWEEN ^^^ AND ^^^)
       OR (cd_demo_sk = ss_cdemo_sk
           AND cd_marital_status = &&&
           AND cd_education_status = &&&
           AND ss_sales_price BETWEEN ^^^ AND ^^^))
  AND ((ss_addr_sk = ca_address_sk
        AND ca_country = &&&
        AND ca_state IN (N_SSS)
        AND ss_net_profit BETWEEN ### AND ###)
       OR (ss_addr_sk = ca_address_sk
           AND ca_country = &&&
           AND ca_state IN (N_SSS)
           AND ss_net_profit BETWEEN ### AND ###)
       OR (ss_addr_sk = ca_address_sk
           AND ca_country = &&&
           AND ca_state IN (N_SSS)
           AND ss_net_profit BETWEEN ### AND ###)) ;