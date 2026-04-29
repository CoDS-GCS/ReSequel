 
  
  
 
SELECT min(w.w_warehouse_name),
       min(sm.sm_type),
       min(cc.cc_name),
       min(cs.cs_order_number),
       min(cs.cs_item_sk)
FROM catalog_sales AS cs
JOIN warehouse AS w ON cs.cs_warehouse_sk = w.w_warehouse_sk
JOIN ship_mode AS sm ON cs.cs_ship_mode_sk = sm.sm_ship_mode_sk
JOIN call_center AS cc ON cs.cs_call_center_sk = cc.cc_call_center_sk
WHERE cs.cs_list_price BETWEEN 77 AND 106
  AND w.w_gmt_offset = -5
  AND sm.sm_type = 'TWO DAY'
  AND cc.cc_class = 'small'
  AND cs.cs_ship_date_sk IN
    (SELECT d_date_sk
     FROM date_dim
     WHERE d_month_seq BETWEEN 1193 AND 1193 + 23);