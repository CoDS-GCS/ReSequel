 
  
  
 WITH sales_in_period AS
  (SELECT cs.cs_item_sk,
          cs.cs_order_number,
          cs.cs_warehouse_sk
   FROM catalog_sales cs
   JOIN date_dim d ON cs.cs_sold_date_sk = d.d_date_sk
   WHERE cs.cs_wholesale_cost BETWEEN 69 AND 88
     AND d.d_date BETWEEN (CAST('1998-04-26' AS date) - interval '30 day') AND (CAST('1998-04-26' AS date) + interval '30 day')),
     relevant_items AS
  (SELECT i_item_sk,
          i_item_id
   FROM item
   WHERE i_category = 'Home'
     AND i_manager_id BETWEEN 28 AND 67)
SELECT min(w.w_state),
       min(ri.i_item_id),
       min(sp.cs_item_sk),
       min(sp.cs_order_number),
       min(cr.cr_item_sk),
       min(cr.cr_order_number)
FROM sales_in_period sp
JOIN relevant_items ri ON sp.cs_item_sk = ri.i_item_sk
JOIN warehouse w ON sp.cs_warehouse_sk = w.w_warehouse_sk
JOIN catalog_returns cr ON sp.cs_order_number = cr.cr_order_number
AND sp.cs_item_sk = cr.cr_item_sk
WHERE cr.cr_reason_sk = 11;