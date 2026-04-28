SELECT min(w_warehouse_name),
       min(sm_type),
       min(cc_name),
       min(cs_order_number),
       min(cs_item_sk)
FROM catalog_sales,
     warehouse,
     ship_mode,
     call_center,
     date_dim
WHERE d_month_seq BETWEEN ###_A AND ###_B + ###_C
  AND cs_ship_date_sk = d_date_sk
  AND cs_warehouse_sk = w_warehouse_sk
  AND cs_ship_mode_sk = sm_ship_mode_sk
  AND cs_call_center_sk = cc_call_center_sk
  AND cs_list_price BETWEEN ###_D AND ###_E
  AND sm_type = &&&_A
  AND cc_class = &&&_B
  AND w_gmt_offset = -###_F ;