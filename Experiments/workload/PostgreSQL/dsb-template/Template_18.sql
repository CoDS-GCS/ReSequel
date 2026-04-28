WITH my_customers AS
  (SELECT DISTINCT c_customer_sk,
                   c_current_addr_sk
   FROM
     (SELECT cs_sold_date_sk sold_date_sk,
             cs_bill_customer_sk customer_sk,
             cs_item_sk item_sk,
             cs_wholesale_cost wholesale_cost
      FROM catalog_sales
      UNION ALL SELECT ws_sold_date_sk sold_date_sk,
                       ws_bill_customer_sk customer_sk,
                       ws_item_sk item_sk,
                       ws_wholesale_cost wholesale_cost
      FROM web_sales) cs_or_ws_sales,
        item,
        date_dim,
        customer
   WHERE sold_date_sk = d_date_sk
     AND item_sk = i_item_sk
     AND i_category = &&&_A
     AND i_class = &&&_B
     AND c_customer_sk = cs_or_ws_sales.customer_sk
     AND d_moy = ###_A
     AND d_year = ###_B
     AND wholesale_cost BETWEEN ###_C AND ###_D
     AND c_birth_year BETWEEN ###_E AND ###_F),
     my_revenue AS
  (SELECT c_customer_sk,
          sum(ss_ext_sales_price) AS revenue
   FROM my_customers,
        store_sales,
        customer_address,
        store,
        date_dim
   WHERE c_current_addr_sk = ca_address_sk
     AND ca_county = s_county
     AND ca_state = s_state
     AND ss_sold_date_sk = d_date_sk
     AND c_customer_sk = ss_customer_sk
     AND ss_wholesale_cost BETWEEN ###_G AND ###_H
     AND s_state IN N_SSS_A
     AND d_month_seq BETWEEN
       (SELECT DISTINCT d_month_seq+###_I
        FROM date_dim
        WHERE d_year = ###_J
          AND d_moy = ###_K) AND
       (SELECT DISTINCT d_month_seq+###_L
        FROM date_dim
        WHERE d_year = ###_M
          AND d_moy = ###_N)
   GROUP BY c_customer_sk),
     segments AS
  (SELECT cast((revenue/###_O) AS int) AS SEGMENT
   FROM my_revenue)
SELECT SEGMENT,
       count(*) AS num_customers,
       SEGMENT*###_P AS segment_base
FROM segments
GROUP BY SEGMENT
ORDER BY SEGMENT,
         num_customers
LIMIT ###_Q;