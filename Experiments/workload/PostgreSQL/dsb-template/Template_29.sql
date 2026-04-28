WITH ss_items AS
  (SELECT i_item_id item_id,
          c_birth_year birth_year,
          sum(ss_ext_sales_price) ss_item_rev
   FROM store_sales,
        item,
        date_dim,
        customer
   WHERE ss_item_sk = i_item_sk
     AND d_date IN
       (SELECT d_date
        FROM date_dim
        WHERE d_month_seq =
            (SELECT d_month_seq
             FROM date_dim
             WHERE d_date = &&&_A))
     AND ss_sold_date_sk = d_date_sk
     AND ss_list_price BETWEEN ###_A AND ###_B
     AND i_manager_id BETWEEN ###_C AND ###_D
     AND ss_customer_sk = c_customer_sk
     AND c_birth_year BETWEEN ###_E AND ###_F
   GROUP BY i_item_id,
            c_birth_year),
     cs_items AS
  (SELECT i_item_id item_id,
          c_birth_year birth_year,
          sum(cs_ext_sales_price) cs_item_rev
   FROM catalog_sales,
        item,
        date_dim,
        customer
   WHERE cs_item_sk = i_item_sk
     AND d_date IN
       (SELECT d_date
        FROM date_dim
        WHERE d_month_seq =
            (SELECT d_month_seq
             FROM date_dim
             WHERE d_date = &&&_B))
     AND cs_sold_date_sk = d_date_sk
     AND cs_list_price BETWEEN ###_G AND ###_H
     AND i_manager_id BETWEEN ###_I AND ###_J
     AND cs_bill_customer_sk = c_customer_sk
     AND c_birth_year BETWEEN ###_K AND ###_L
   GROUP BY i_item_id,
            c_birth_year),
     ws_items AS
  (SELECT i_item_id item_id,
          c_birth_year birth_year,
          sum(ws_ext_sales_price) ws_item_rev
   FROM web_sales,
        item,
        date_dim,
        customer
   WHERE ws_item_sk = i_item_sk
     AND d_date IN
       (SELECT d_date
        FROM date_dim
        WHERE d_month_seq =
            (SELECT d_month_seq
             FROM date_dim
             WHERE d_date = &&&_C))
     AND ws_sold_date_sk = d_date_sk
     AND ws_list_price BETWEEN ###_M AND ###_N
     AND i_manager_id BETWEEN ###_O AND ###_P
     AND ws_bill_customer_sk = c_customer_sk
     AND c_birth_year BETWEEN ###_Q AND ###_R
   GROUP BY i_item_id,
            c_birth_year)
SELECT ss_items.item_id,
       ss_items.birth_year,
       ss_item_rev,
       ss_item_rev/((ss_item_rev+cs_item_rev+ws_item_rev)/###_S) * ###_T ss_dev,
       cs_item_rev,
       cs_item_rev/((ss_item_rev+cs_item_rev+ws_item_rev)/###_U) * ###_V cs_dev,
       ws_item_rev,
       ws_item_rev/((ss_item_rev+cs_item_rev+ws_item_rev)/###_W) * ###_X ws_dev,
       (ss_item_rev+cs_item_rev+ws_item_rev)/###_Y average
FROM ss_items,
     cs_items,
     ws_items
WHERE ss_items.item_id=cs_items.item_id
  AND ss_items.item_id=ws_items.item_id
  AND ss_items.birth_year = cs_items.birth_year
  AND ss_items.birth_year = ws_items.birth_year
  AND ss_item_rev BETWEEN ^^^_A * cs_item_rev AND ^^^_B * cs_item_rev
  AND ss_item_rev BETWEEN ^^^_C * ws_item_rev AND ^^^_D * ws_item_rev
  AND cs_item_rev BETWEEN ^^^_E * ss_item_rev AND ^^^_F * ss_item_rev
  AND cs_item_rev BETWEEN ^^^_G * ws_item_rev AND ^^^_H * ws_item_rev
  AND ws_item_rev BETWEEN ^^^_I * ss_item_rev AND ^^^_J * ss_item_rev
  AND ws_item_rev BETWEEN ^^^_K * cs_item_rev AND ^^^_L * cs_item_rev
ORDER BY ss_items.item_id,
         ss_items.birth_year,
         ss_items.ss_item_rev
LIMIT ###_Z;