SELECT w_state,
       i_item_id,
       sum(CASE
               WHEN (cast(d_date AS date) < CAST (&&&_A AS date)) THEN cs_sales_price - coalesce(cr_refunded_cash, ###_A)
               ELSE ###_B
           END) AS sales_before,
       sum(CASE
               WHEN (cast(d_date AS date) >= CAST (&&&_B AS date)) THEN cs_sales_price - coalesce(cr_refunded_cash, ###_C)
               ELSE ###_D
           END) AS sales_after
FROM catalog_sales
LEFT OUTER JOIN catalog_returns ON (cs_order_number = cr_order_number
                                    AND cs_item_sk = cr_item_sk) ,warehouse,
                                                                  item,
                                                                  date_dim
WHERE i_item_sk = cs_item_sk
  AND cs_warehouse_sk = w_warehouse_sk
  AND cs_sold_date_sk = d_date_sk
  AND d_date BETWEEN (CAST (&&&_C AS date) - interval &&&_D) AND (CAST (&&&_E AS date) + interval &&&_F)
  AND i_category = &&&_G
  AND i_manager_id BETWEEN ###_E AND ###_F
  AND cs_wholesale_cost BETWEEN ###_G AND ###_H
  AND cr_reason_sk = ###_I
GROUP BY w_state,
         i_item_id
ORDER BY w_state,
         i_item_id
LIMIT ###_J;