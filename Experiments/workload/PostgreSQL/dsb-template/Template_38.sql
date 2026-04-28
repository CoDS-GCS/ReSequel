SELECT cd_gender,
       cd_marital_status,
       cd_education_status,
       count(*) cnt1,
       cd_purchase_estimate,
       count(*) cnt2,
       cd_credit_rating,
       count(*) cnt3,
       cd_dep_count,
       count(*) cnt4,
       cd_dep_employed_count,
       count(*) cnt5,
       cd_dep_college_count,
       count(*) cnt6
FROM customer c,
     customer_address ca,
     customer_demographics
WHERE c.c_current_addr_sk = ca.ca_address_sk
  AND ca_county IN N_SSS_A
  AND c.c_birth_month IN N_III_A
  AND cd_demo_sk = c.c_current_cdemo_sk
  AND cd_marital_status IN N_SSS_B
  AND cd_education_status IN N_SSS_C
  AND cd_gender = &&&_A
  AND EXISTS
    (SELECT *
     FROM store_sales,
          date_dim,
          item
     WHERE c.c_customer_sk = ss_customer_sk
       AND ss_sold_date_sk = d_date_sk
       AND d_year = ###_A
       AND d_moy BETWEEN ###_B AND ###_C+###_D
       AND ss_item_sk = i_item_sk
       AND i_category IN N_SSS_D
       AND ss_sales_price / ss_list_price BETWEEN ###_E * ^^^_A AND ###_F * ^^^_B
       AND i_manager_id BETWEEN ###_G AND ###_H)
  AND (EXISTS
         (SELECT *
          FROM web_sales,
               date_dim,
               item
          WHERE c.c_customer_sk = ws_bill_customer_sk
            AND ws_sold_date_sk = d_date_sk
            AND d_year = ###_I
            AND d_moy BETWEEN ###_J AND ###_K+###_L
            AND ws_item_sk = i_item_sk
            AND i_category IN N_SSS_E
            AND i_manager_id BETWEEN ###_M AND ###_N
            AND ws_sales_price / ws_list_price BETWEEN ###_O * ^^^_C AND ###_P * ^^^_D)
       OR EXISTS
         (SELECT *
          FROM catalog_sales,
               date_dim,
               item
          WHERE c.c_customer_sk = cs_ship_customer_sk
            AND cs_sold_date_sk = d_date_sk
            AND d_year = ###_Q
            AND d_moy BETWEEN ###_R AND ###_S+###_T
            AND cs_item_sk = i_item_sk
            AND i_category IN N_SSS_F
            AND i_manager_id BETWEEN ###_U AND ###_V
            AND cs_sales_price / cs_list_price BETWEEN ###_W * ^^^_E AND ###_X * ^^^_F))
GROUP BY cd_gender,
         cd_marital_status,
         cd_education_status,
         cd_purchase_estimate,
         cd_credit_rating,
         cd_dep_count,
         cd_dep_employed_count,
         cd_dep_college_count
ORDER BY cd_gender,
         cd_marital_status,
         cd_education_status,
         cd_purchase_estimate,
         cd_credit_rating,
         cd_dep_count,
         cd_dep_employed_count,
         cd_dep_college_count
LIMIT ###_Y;