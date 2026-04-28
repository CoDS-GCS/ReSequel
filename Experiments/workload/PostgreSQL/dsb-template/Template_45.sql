SELECT cd_gender,
       cd_marital_status,
       cd_education_status,
       count(*) cnt1,
       cd_purchase_estimate,
       count(*) cnt2,
       cd_credit_rating,
       count(*) cnt3
FROM customer c,
     customer_address ca,
     customer_demographics
WHERE c.c_current_addr_sk = ca.ca_address_sk
  AND ca_state IN N_SSS_A
  AND cd_demo_sk = c.c_current_cdemo_sk
  AND cd_marital_status IN N_SSS_B
  AND cd_education_status IN N_SSS_C
  AND EXISTS
    (SELECT *
     FROM store_sales,
          date_dim
     WHERE c.c_customer_sk = ss_customer_sk
       AND ss_sold_date_sk = d_date_sk
       AND d_year = ###_A
       AND d_moy BETWEEN ###_B AND ###_C+###_D
       AND ss_list_price BETWEEN ###_E AND ###_F)
  AND (NOT EXISTS
         (SELECT *
          FROM web_sales,
               date_dim
          WHERE c.c_customer_sk = ws_bill_customer_sk
            AND ws_sold_date_sk = d_date_sk
            AND d_year = ###_G
            AND d_moy BETWEEN ###_H AND ###_I+###_J
            AND ws_list_price BETWEEN ###_K AND ###_L)
       AND NOT EXISTS
         (SELECT *
          FROM catalog_sales,
               date_dim
          WHERE c.c_customer_sk = cs_ship_customer_sk
            AND cs_sold_date_sk = d_date_sk
            AND d_year = ###_M
            AND d_moy BETWEEN ###_N AND ###_O+###_P
            AND cs_list_price BETWEEN ###_Q AND ###_R))
GROUP BY cd_gender,
         cd_marital_status,
         cd_education_status,
         cd_purchase_estimate,
         cd_credit_rating
ORDER BY cd_gender,
         cd_marital_status,
         cd_education_status,
         cd_purchase_estimate,
         cd_credit_rating
LIMIT ###_S;