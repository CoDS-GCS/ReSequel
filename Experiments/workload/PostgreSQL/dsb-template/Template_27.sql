SELECT min(w_state),
       min(i_item_id),
       min(cs_item_sk),
       min(cs_order_number),
       min(cr_item_sk),
       min(cr_order_number)
FROM catalog_sales
LEFT OUTER JOIN catalog_returns ON (cs_order_number = cr_order_number
                                    AND cs_item_sk = cr_item_sk) ,warehouse,
                                                                  item,
                                                                  date_dim
WHERE i_item_sk = cs_item_sk
  AND cs_warehouse_sk = w_warehouse_sk
  AND cs_sold_date_sk = d_date_sk
  AND d_date BETWEEN (CAST (&&&_A AS date) - interval &&&_B) AND (CAST (&&&_C AS date) + interval &&&_D)
  AND i_category = &&&_E
  AND i_manager_id BETWEEN ###_A AND ###_B
  AND cs_wholesale_cost BETWEEN ###_C AND ###_D
  AND cr_reason_sk = ###_E ;