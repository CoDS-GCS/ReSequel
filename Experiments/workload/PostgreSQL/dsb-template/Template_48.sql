WITH frequent_ss_items AS
  (SELECT substring(i_item_desc, ###_A, ###_B) itemdesc,
          i_item_sk item_sk,
          d_date solddate,
          count(*) cnt
   FROM store_sales,
        date_dim,
        item
   WHERE ss_sold_date_sk = d_date_sk
     AND ss_item_sk = i_item_sk
     AND d_year = ###_C
     AND i_manager_id BETWEEN ###_D AND ###_E
     AND i_category IN N_SSS_A
   GROUP BY substring(i_item_desc, ###_F, ###_G),
            i_item_sk,
            d_date
   HAVING count(*) >###_H),
     max_store_sales AS
  (SELECT max(csales) tpcds_cmax
   FROM
     (SELECT c_customer_sk,
             sum(ss_quantity*ss_sales_price) csales
      FROM store_sales,
           customer,
           date_dim
      WHERE ss_customer_sk = c_customer_sk
        AND ss_sold_date_sk = d_date_sk
        AND d_year = ###_I
        AND ss_wholesale_cost BETWEEN ###_J AND ###_K
      GROUP BY c_customer_sk) tmp1),
     best_ss_customer AS
  (SELECT c_customer_sk,
          sum(ss_quantity*ss_sales_price) ssales
   FROM store_sales,
        customer
   WHERE ss_customer_sk = c_customer_sk
     AND c_birth_year BETWEEN ###_L AND ###_M
   GROUP BY c_customer_sk
   HAVING sum(ss_quantity*ss_sales_price) > (###_N/^^^_A) *
     (SELECT *
      FROM max_store_sales))
SELECT sum(sales)
FROM
  (SELECT cs_quantity*cs_list_price sales
   FROM catalog_sales,
        date_dim
   WHERE d_year = ###_O
     AND d_moy = ###_P
     AND cs_sold_date_sk = d_date_sk
     AND cs_item_sk IN
       (SELECT item_sk
        FROM frequent_ss_items)
     AND cs_bill_customer_sk IN
       (SELECT c_customer_sk
        FROM best_ss_customer)
     AND cs_wholesale_cost BETWEEN ###_Q AND ###_R
   UNION ALL SELECT ws_quantity*ws_list_price sales
   FROM web_sales,
        date_dim
   WHERE d_year = ###_S
     AND d_moy = ###_T
     AND ws_sold_date_sk = d_date_sk
     AND ws_item_sk IN
       (SELECT item_sk
        FROM frequent_ss_items)
     AND ws_bill_customer_sk IN
       (SELECT c_customer_sk
        FROM best_ss_customer)
     AND ws_wholesale_cost BETWEEN ###_U AND ###_V) tmp2
LIMIT ###_W;