SELECT sum(ws_ext_discount_amt) AS "Excess Discount Amount"
FROM web_sales,
     item,
     date_dim
WHERE (i_manufact_id BETWEEN ###_A AND ###_B
       OR i_category IN N_SSS_A)
  AND i_item_sk = ws_item_sk
  AND d_date BETWEEN &&&_A AND cast(&&&_B AS date) + interval &&&_C
  AND d_date_sk = ws_sold_date_sk
  AND ws_wholesale_cost BETWEEN ###_C AND ###_D
  AND ws_ext_discount_amt >
    (SELECT ^^^_A * avg(ws_ext_discount_amt)
     FROM web_sales,
          date_dim
     WHERE ws_item_sk = i_item_sk
       AND d_date BETWEEN &&&_D AND cast(&&&_E AS date) + interval &&&_F
       AND d_date_sk = ws_sold_date_sk
       AND ws_wholesale_cost BETWEEN ###_E AND ###_F
       AND ws_sales_price / ws_list_price BETWEEN ###_G * ^^^_B AND ###_H * ^^^_C)
ORDER BY sum(ws_ext_discount_amt)
LIMIT ###_I;