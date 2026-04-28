SELECT s_store_name,
       i_item_desc,
       sc.revenue,
       i_current_price,
       i_wholesale_cost,
       i_brand
FROM store,
     item,

  (SELECT ss_store_sk,
          avg(revenue) AS ave
   FROM
     (SELECT ss_store_sk,
             ss_item_sk,
             sum(ss_sales_price) AS revenue
      FROM store_sales,
           date_dim
      WHERE ss_sold_date_sk = d_date_sk
        AND d_month_seq BETWEEN ###_A AND ###_B+###_C
        AND ss_sales_price / ss_list_price BETWEEN ###_D * ^^^_A AND ###_E * ^^^_B
      GROUP BY ss_store_sk,
               ss_item_sk) sa
   GROUP BY ss_store_sk) sb,

  (SELECT ss_store_sk,
          ss_item_sk,
          sum(ss_sales_price) AS revenue
   FROM store_sales,
        date_dim
   WHERE ss_sold_date_sk = d_date_sk
     AND d_month_seq BETWEEN ###_F AND ###_G+###_H
     AND ss_sales_price / ss_list_price BETWEEN ###_I * ^^^_C AND ###_J * ^^^_D
   GROUP BY ss_store_sk,
            ss_item_sk) sc
WHERE sb.ss_store_sk = sc.ss_store_sk
  AND sc.revenue <= ^^^_E * sb.ave
  AND s_store_sk = sc.ss_store_sk
  AND i_item_sk = sc.ss_item_sk
  AND i_manager_id BETWEEN ###_K AND ###_L
  AND s_state IN N_SSS_A
ORDER BY s_store_name,
         i_item_desc
LIMIT ###_M;