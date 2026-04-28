WITH sr_items AS
  (SELECT i_item_id item_id,
          sum(sr_return_quantity) sr_item_qty
   FROM store_returns,
        item,
        date_dim
   WHERE sr_item_sk = i_item_sk
     AND d_date IN
       (SELECT d_date
        FROM date_dim
        WHERE d_month_seq IN
            (SELECT d_month_seq
             FROM date_dim
             WHERE d_date IN N_SSS_A))
     AND sr_returned_date_sk = d_date_sk
     AND i_category IN N_SSS_B
     AND i_manager_id BETWEEN ###_A AND ###_B
     AND sr_return_amt / sr_return_quantity BETWEEN ###_C AND ###_D
     AND sr_reason_sk IN N_III_A
   GROUP BY i_item_id),
     cr_items AS
  (SELECT i_item_id item_id,
          sum(cr_return_quantity) cr_item_qty
   FROM catalog_returns,
        item,
        date_dim
   WHERE cr_item_sk = i_item_sk
     AND d_date IN
       (SELECT d_date
        FROM date_dim
        WHERE d_month_seq IN
            (SELECT d_month_seq
             FROM date_dim
             WHERE d_date IN N_SSS_C))
     AND cr_returned_date_sk = d_date_sk
     AND i_category IN N_SSS_D
     AND i_manager_id BETWEEN ###_E AND ###_F
     AND cr_return_amount / cr_return_quantity BETWEEN ###_G AND ###_H
     AND cr_reason_sk IN N_III_B
   GROUP BY i_item_id),
     wr_items AS
  (SELECT i_item_id item_id,
          sum(wr_return_quantity) wr_item_qty
   FROM web_returns,
        item,
        date_dim
   WHERE wr_item_sk = i_item_sk
     AND d_date IN
       (SELECT d_date
        FROM date_dim
        WHERE d_month_seq IN
            (SELECT d_month_seq
             FROM date_dim
             WHERE d_date IN N_SSS_E))
     AND wr_returned_date_sk = d_date_sk
     AND i_category IN N_SSS_F
     AND i_manager_id BETWEEN ###_I AND ###_J
     AND wr_return_amt / wr_return_quantity BETWEEN ###_K AND ###_L
     AND wr_reason_sk IN N_III_C
   GROUP BY i_item_id)
SELECT sr_items.item_id,
       sr_item_qty,
       sr_item_qty/(sr_item_qty+cr_item_qty+wr_item_qty)/^^^_A * ###_M sr_dev,
       cr_item_qty,
       cr_item_qty/(sr_item_qty+cr_item_qty+wr_item_qty)/^^^_B * ###_N cr_dev,
       wr_item_qty,
       wr_item_qty/(sr_item_qty+cr_item_qty+wr_item_qty)/^^^_C * ###_O wr_dev,
       (sr_item_qty+cr_item_qty+wr_item_qty)/^^^_D average
FROM sr_items,
     cr_items,
     wr_items
WHERE sr_items.item_id=cr_items.item_id
  AND sr_items.item_id=wr_items.item_id
ORDER BY sr_items.item_id,
         sr_item_qty
LIMIT ###_P;