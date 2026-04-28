SELECT s_store_name,
       s_company_id,
       s_street_number,
       s_street_name,
       s_street_type,
       s_suite_number,
       s_city,
       s_county,
       s_state,
       s_zip,
       sum(CASE
               WHEN (sr_returned_date_sk - ss_sold_date_sk <= ###_A) THEN ###_B
               ELSE ###_C
           END) AS "###_D days",
       sum(CASE
               WHEN (sr_returned_date_sk - ss_sold_date_sk > ###_E)
                    AND (sr_returned_date_sk - ss_sold_date_sk <= ###_F) THEN ###_G
               ELSE ###_H
           END) AS "###_I-###_J days",
       sum(CASE
               WHEN (sr_returned_date_sk - ss_sold_date_sk > ###_K)
                    AND (sr_returned_date_sk - ss_sold_date_sk <= ###_L) THEN ###_M
               ELSE ###_N
           END) AS "###_O-###_P days",
       sum(CASE
               WHEN (sr_returned_date_sk - ss_sold_date_sk > ###_Q)
                    AND (sr_returned_date_sk - ss_sold_date_sk <= ###_R) THEN ###_S
               ELSE ###_T
           END) AS "###_U-###_V days",
       sum(CASE
               WHEN (sr_returned_date_sk - ss_sold_date_sk > ###_W) THEN ###_X
               ELSE ###_Y
           END) AS ">###_Z days"
FROM store_sales,
     store_returns,
     store,
     date_dim d1,
     date_dim d2
WHERE d2.d_year = ###_AA
  AND d2.d_moy = ###_AB
  AND ss_ticket_number = sr_ticket_number
  AND ss_item_sk = sr_item_sk
  AND ss_sold_date_sk = d1.d_date_sk
  AND sr_returned_date_sk = d2.d_date_sk
  AND ss_customer_sk = sr_customer_sk
  AND ss_store_sk = s_store_sk
  AND d1.d_date BETWEEN (d2.d_date - interval &&&_A) AND d2.d_date
GROUP BY s_store_name,
         s_company_id,
         s_street_number,
         s_street_name,
         s_street_type,
         s_suite_number,
         s_city,
         s_county,
         s_state,
         s_zip
ORDER BY s_store_name,
         s_company_id,
         s_street_number,
         s_street_name,
         s_street_type,
         s_suite_number,
         s_city,
         s_county,
         s_state,
         s_zip
LIMIT ###_AC;