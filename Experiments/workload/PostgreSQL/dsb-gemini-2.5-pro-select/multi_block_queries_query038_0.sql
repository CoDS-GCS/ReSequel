
SELECT count(*)
FROM
  (SELECT DISTINCT s.ss_customer_sk,
                   s.ss_sold_date_sk
   FROM
     (SELECT ss_customer_sk,
             ss_sold_date_sk
      FROM store_sales
      WHERE ss_list_price BETWEEN 28 AND 87
        AND ss_wholesale_cost BETWEEN 80 AND 100) s
   JOIN
     (SELECT cs_bill_customer_sk,
             cs_sold_date_sk
      FROM catalog_sales
      WHERE cs_list_price BETWEEN 28 AND 87
        AND cs_wholesale_cost BETWEEN 80 AND 100) c ON s.ss_customer_sk = c.cs_bill_customer_sk
   AND s.ss_sold_date_sk = c.cs_sold_date_sk
   JOIN
     (SELECT ws_bill_customer_sk,
             ws_sold_date_sk
      FROM web_sales
      WHERE ws_list_price BETWEEN 28 AND 87
        AND ws_wholesale_cost BETWEEN 80 AND 100) w ON s.ss_customer_sk = w.ws_bill_customer_sk
   AND s.ss_sold_date_sk = w.ws_sold_date_sk
   JOIN customer cust ON s.ss_customer_sk = cust.c_customer_sk
   JOIN date_dim d ON s.ss_sold_date_sk = d.d_date_sk
   WHERE (cust.c_birth_month IN (2,
                           3,
                           10,
                           12)
          AND d.d_month_seq BETWEEN 1185 AND 1185 + 11)
     AND (cust.c_birth_month IN (2,
                           3,
                           10,
                           12)
          AND d.d_month_seq BETWEEN 1185 AND 1185 + 11)
     AND (cust.c_birth_month IN (2,
                           3,
                           10,
                           12)
          AND d.d_month_seq BETWEEN 1185 AND 1185 + 11)) hot_cust
LIMIT 100;