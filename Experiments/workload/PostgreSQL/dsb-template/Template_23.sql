SELECT i_item_id,
       s_state,
       grouping(s_state) g_state,
       avg(ss_quantity) agg1,
       avg(ss_list_price) agg2,
       avg(ss_coupon_amt) agg3,
       avg(ss_sales_price) agg4
FROM store_sales,
     customer_demographics,
     date_dim,
     store,
     item
WHERE ss_sold_date_sk = d_date_sk
  AND ss_item_sk = i_item_sk
  AND ss_store_sk = s_store_sk
  AND ss_cdemo_sk = cd_demo_sk
  AND cd_gender = &&&_A
  AND cd_marital_status = &&&_B
  AND cd_education_status = &&&_C
  AND d_year = ###_A
  AND s_state = &&&_D
  AND i_category = &&&_E
GROUP BY ROLLUP (i_item_id,
                 s_state)
ORDER BY i_item_id,
         s_state
LIMIT ###_B;