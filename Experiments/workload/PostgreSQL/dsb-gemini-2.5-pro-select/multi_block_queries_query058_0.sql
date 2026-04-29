WITH ss_filtered_items AS
  (SELECT i_item_sk,
          i_item_id
   FROM item
   WHERE i_manager_id BETWEEN 28 AND 57),
     cs_filtered_items AS
  (SELECT i_item_sk,
          i_item_id
   FROM item
   WHERE i_manager_id BETWEEN 28 AND 57),
     ws_filtered_items AS
  (SELECT i_item_sk,
          i_item_id
   FROM item
   WHERE i_manager_id BETWEEN 28 AND 57),
     ss_filtered_customers AS
  (SELECT c_customer_sk,
          c_birth_year
   FROM customer
   WHERE c_birth_year BETWEEN 1938 AND 1944),
     cs_filtered_customers AS
  (SELECT c_customer_sk,
          c_birth_year
   FROM customer
   WHERE c_birth_year BETWEEN 1938 AND 1944),
     ws_filtered_customers AS
  (SELECT c_customer_sk,
          c_birth_year
   FROM customer
   WHERE c_birth_year BETWEEN 1938 AND 1944),
     ss_items AS
  (SELECT i.i_item_id AS item_id,
          c.c_birth_year AS birth_year,
          sum(ss.ss_ext_sales_price) AS ss_item_rev
   FROM store_sales ss
   JOIN date_dim d ON ss.ss_sold_date_sk = d.d_date_sk
   JOIN ss_filtered_items i ON ss.ss_item_sk = i.i_item_sk
   JOIN ss_filtered_customers c ON ss.ss_customer_sk = c.c_customer_sk
   WHERE d.d_month_seq =
       (SELECT d_month_seq
        FROM date_dim
        WHERE d_date = '1999-02-11')
     AND ss.ss_list_price BETWEEN 269 AND 298
   GROUP BY i.i_item_id,
            c.c_birth_year),
     cs_items AS
  (SELECT i.i_item_id AS item_id,
          c.c_birth_year AS birth_year,
          sum(cs.cs_ext_sales_price) AS cs_item_rev
   FROM catalog_sales cs
   JOIN date_dim d ON cs.cs_sold_date_sk = d.d_date_sk
   JOIN cs_filtered_items i ON cs.cs_item_sk = i.i_item_sk
   JOIN cs_filtered_customers c ON cs.cs_bill_customer_sk = c.c_customer_sk
   WHERE d.d_month_seq =
       (SELECT d_month_seq
        FROM date_dim
        WHERE d_date = '1999-02-11')
     AND cs.cs_list_price BETWEEN 269 AND 298
   GROUP BY i.i_item_id,
            c.c_birth_year),
     ws_items AS
  (SELECT i.i_item_id AS item_id,
          c.c_birth_year AS birth_year,
          sum(ws.ws_ext_sales_price) AS ws_item_rev
   FROM web_sales ws
   JOIN date_dim d ON ws.ws_sold_date_sk = d.d_date_sk
   JOIN ws_filtered_items i ON ws.ws_item_sk = i.i_item_sk
   JOIN ws_filtered_customers c ON ws.ws_bill_customer_sk = c.c_customer_sk
   WHERE d.d_month_seq =
       (SELECT d_month_seq
        FROM date_dim
        WHERE d_date = '1999-02-11')
     AND ws.ws_list_price BETWEEN 269 AND 298
   GROUP BY i.i_item_id,
            c.c_birth_year),
     all_items AS
  (SELECT ss_items.item_id,
          ss_items.birth_year,
          ss_items.ss_item_rev,
          cs_items.cs_item_rev,
          ws_items.ws_item_rev
   FROM ss_items
   JOIN cs_items ON ss_items.item_id = cs_items.item_id
   AND ss_items.birth_year = cs_items.birth_year
   JOIN ws_items ON ss_items.item_id = ws_items.item_id
   AND ss_items.birth_year = ws_items.birth_year
   WHERE ss_items.ss_item_rev BETWEEN 0.9 * cs_items.cs_item_rev AND 1.1 * cs_items.cs_item_rev
     AND ss_items.ss_item_rev BETWEEN 0.9 * ws_items.ws_item_rev AND 1.1 * ws_items.ws_item_rev
     AND cs_items.cs_item_rev BETWEEN 0.9 * ss_items.ss_item_rev AND 1.1 * ss_items.ss_item_rev
     AND cs_items.cs_item_rev BETWEEN 0.9 * ws_items.ws_item_rev AND 1.1 * ws_items.ws_item_rev
     AND ws_items.ws_item_rev BETWEEN 0.9 * ss_items.ss_item_rev AND 1.1 * ss_items.ss_item_rev
     AND ws_items.ws_item_rev BETWEEN 0.9 * cs_items.cs_item_rev AND 1.1 * cs_items.cs_item_rev)
SELECT item_id,
       birth_year,
       ss_item_rev,
       ss_item_rev/((ss_item_rev+cs_item_rev+ws_item_rev)/3) * 100 ss_dev,
                                                                      cs_item_rev,
                                                                      cs_item_rev/((ss_item_rev+cs_item_rev+ws_item_rev)/3) * 100 cs_dev,
                                                                                                                                     ws_item_rev,
                                                                                                                                     ws_item_rev/((ss_item_rev+cs_item_rev+ws_item_rev)/3) * 100 ws_dev,
                                                                                                                                                                                                    (ss_item_rev+cs_item_rev+ws_item_rev)/3 average
FROM all_items
ORDER BY item_id,
         birth_year,
         ss_item_rev
LIMIT 100;