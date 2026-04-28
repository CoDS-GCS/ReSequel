WITH all_sales AS
  (SELECT d_year,
          i_brand_id,
          i_class_id,
          i_category_id,
          i_manufact_id,
          SUM(sales_cnt) AS sales_cnt,
          SUM(sales_amt) AS sales_amt
   FROM
     (SELECT d_year,
             i_brand_id,
             i_class_id,
             i_category_id,
             i_manufact_id,
             cs_quantity - COALESCE(cr_return_quantity, ###_A) AS sales_cnt,
             cs_ext_sales_price - COALESCE(cr_return_amount, ^^^_A) AS sales_amt
      FROM catalog_sales
      JOIN item ON i_item_sk=cs_item_sk
      JOIN date_dim ON d_date_sk=cs_sold_date_sk
      LEFT JOIN catalog_returns ON (cs_order_number=cr_order_number
                                    AND cs_item_sk=cr_item_sk)
      WHERE i_category=&&&_A
        AND cs_sales_price / cs_list_price BETWEEN ###_B * ^^^_B AND ###_C * ^^^_C
        AND cr_reason_sk IN N_III_A
      UNION SELECT d_year,
                   i_brand_id,
                   i_class_id,
                   i_category_id,
                   i_manufact_id,
                   ss_quantity - COALESCE(sr_return_quantity, ###_D) AS sales_cnt,
                   ss_ext_sales_price - COALESCE(sr_return_amt, ^^^_D) AS sales_amt
      FROM store_sales
      JOIN item ON i_item_sk=ss_item_sk
      JOIN date_dim ON d_date_sk=ss_sold_date_sk
      LEFT JOIN store_returns ON (ss_ticket_number=sr_ticket_number
                                  AND ss_item_sk=sr_item_sk)
      WHERE i_category=&&&_B
        AND ss_sales_price / ss_list_price BETWEEN ###_E * ^^^_E AND ###_F * ^^^_F
        AND sr_reason_sk IN N_III_B
      UNION SELECT d_year,
                   i_brand_id,
                   i_class_id,
                   i_category_id,
                   i_manufact_id,
                   ws_quantity - COALESCE(wr_return_quantity, ###_G) AS sales_cnt,
                   ws_ext_sales_price - COALESCE(wr_return_amt, ^^^_G) AS sales_amt
      FROM web_sales
      JOIN item ON i_item_sk=ws_item_sk
      JOIN date_dim ON d_date_sk=ws_sold_date_sk
      LEFT JOIN web_returns ON (ws_order_number=wr_order_number
                                AND ws_item_sk=wr_item_sk)
      WHERE i_category=&&&_C
        AND ws_sales_price / ws_list_price BETWEEN ###_H * ^^^_H AND ###_I * ^^^_I
        AND wr_reason_sk IN N_III_C) sales_detail
   GROUP BY d_year,
            i_brand_id,
            i_class_id,
            i_category_id,
            i_manufact_id)
SELECT prev_yr.d_year AS prev_year,
       curr_yr.d_year AS YEAR,
       curr_yr.i_brand_id,
       curr_yr.i_class_id,
       curr_yr.i_category_id,
       curr_yr.i_manufact_id,
       prev_yr.sales_cnt AS prev_yr_cnt,
       curr_yr.sales_cnt AS curr_yr_cnt,
       curr_yr.sales_cnt-prev_yr.sales_cnt AS sales_cnt_diff,
       curr_yr.sales_amt-prev_yr.sales_amt AS sales_amt_diff
FROM all_sales curr_yr,
     all_sales prev_yr
WHERE curr_yr.i_brand_id=prev_yr.i_brand_id
  AND curr_yr.i_class_id=prev_yr.i_class_id
  AND curr_yr.i_category_id=prev_yr.i_category_id
  AND curr_yr.i_manufact_id=prev_yr.i_manufact_id
  AND curr_yr.d_year=###_J
  AND prev_yr.d_year=###_K-###_L
  AND prev_yr.sales_cnt > ###_M
  AND CAST(curr_yr.sales_cnt AS DECIMALN_III_D)/CAST(prev_yr.sales_cnt AS DECIMALN_III_E)<^^^_J
ORDER BY sales_cnt_diff,
         sales_amt_diff
LIMIT ###_N;