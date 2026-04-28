SELECT substring(w_warehouse_name, ###_A, ###_B),
       sm_type,
       cc_name,
       sum(CASE
               WHEN (cs_ship_date_sk - cs_sold_date_sk <= ###_C) THEN ###_D
               ELSE ###_E
           END) AS "###_F days",
       sum(CASE
               WHEN (cs_ship_date_sk - cs_sold_date_sk > ###_G)
                    AND (cs_ship_date_sk - cs_sold_date_sk <= ###_H) THEN ###_I
               ELSE ###_J
           END) AS "###_K-###_L days",
       sum(CASE
               WHEN (cs_ship_date_sk - cs_sold_date_sk > ###_M)
                    AND (cs_ship_date_sk - cs_sold_date_sk <= ###_N) THEN ###_O
               ELSE ###_P
           END) AS "###_Q-###_R days",
       sum(CASE
               WHEN (cs_ship_date_sk - cs_sold_date_sk > ###_S)
                    AND (cs_ship_date_sk - cs_sold_date_sk <= ###_T) THEN ###_U
               ELSE ###_V
           END) AS "###_W-###_X days",
       sum(CASE
               WHEN (cs_ship_date_sk - cs_sold_date_sk > ###_Y) THEN ###_Z
               ELSE ###_AA
           END) AS ">###_AB days"
FROM catalog_sales,
     warehouse,
     ship_mode,
     call_center,
     date_dim
WHERE d_month_seq BETWEEN ###_AC AND ###_AD + ###_AE
  AND cs_ship_date_sk = d_date_sk
  AND cs_warehouse_sk = w_warehouse_sk
  AND cs_ship_mode_sk = sm_ship_mode_sk
  AND cs_call_center_sk = cc_call_center_sk
  AND cs_list_price BETWEEN ###_AF AND ###_AG
  AND sm_type = &&&_A
  AND cc_class = &&&_B
  AND w_gmt_offset = -###_AH
GROUP BY substring(w_warehouse_name, ###_AI, ###_AJ),
         sm_type,
         cc_name
ORDER BY substring(w_warehouse_name, ###_AK, ###_AL),
         sm_type,
         cc_name
LIMIT ###_AM;