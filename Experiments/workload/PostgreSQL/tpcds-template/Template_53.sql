SELECT i_item_id,
       i_item_desc,
       i_current_price
FROM item,
     inventory,
     date_dim,
     store_sales
WHERE i_current_price BETWEEN ### AND ###
  AND inv_item_sk = i_item_sk
  AND d_date_sk=inv_date_sk
  AND d_date BETWEEN cast('2000-05-25' AS date) AND cast('2000-07-24' AS date)
  AND i_manufact_id IN (N_III)
  AND inv_quantity_on_hand BETWEEN ### AND ###
  AND ss_item_sk = i_item_sk
GROUP BY i_item_id,
         i_item_desc,
         i_current_price
ORDER BY i_item_id
LIMIT ###;