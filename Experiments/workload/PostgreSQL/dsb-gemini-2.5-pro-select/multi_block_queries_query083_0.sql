WITH sr_dates AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_month_seq IN
       (SELECT d_month_seq
        FROM date_dim
        WHERE d_date IN ('1998-03-05',
                              '1998-06-15',
                              '1998-09-12',
                              '1998-10-31'))),
     cr_dates AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_month_seq IN
       (SELECT d_month_seq
        FROM date_dim
        WHERE d_date IN ('1998-03-05',
                              '1998-06-15',
                              '1998-09-12',
                              '1998-10-31'))),
     wr_dates AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_month_seq IN
       (SELECT d_month_seq
        FROM date_dim
        WHERE d_date IN ('1998-03-05',
                              '1998-06-15',
                              '1998-09-12',
                              '1998-10-31'))),
     sr_items AS
  (SELECT i_item_id item_id,
          sum(sr_return_quantity) sr_item_qty
   FROM store_returns,
        item,
        sr_dates
   WHERE sr_item_sk = i_item_sk
     AND sr_returned_date_sk = sr_dates.d_date_sk
     AND i_category IN ('Books',
                        'Sports')
     AND i_manager_id BETWEEN 36 AND 45
     AND sr_return_amt / sr_return_quantity BETWEEN 141 AND 170
     AND sr_reason_sk IN (6,
                          29,
                          42,
                          45,
                          62)
   GROUP BY i_item_id),
     cr_items AS
  (SELECT i_item_id item_id,
          sum(cr_return_quantity) cr_item_qty
   FROM catalog_returns,
        item,
        cr_dates
   WHERE cr_item_sk = i_item_sk
     AND cr_returned_date_sk = cr_dates.d_date_sk
     AND i_category IN ('Books',
                        'Sports')
     AND i_manager_id BETWEEN 36 AND 45
     AND cr_return_amount / cr_return_quantity BETWEEN 141 AND 170
     AND cr_reason_sk IN (6,
                          29,
                          42,
                          45,
                          62)
   GROUP BY i_item_id),
     wr_items AS
  (SELECT i_item_id item_id,
          sum(wr_return_quantity) wr_item_qty
   FROM web_returns,
        item,
        wr_dates
   WHERE wr_item_sk = i_item_sk
     AND wr_returned_date_sk = wr_dates.d_date_sk
     AND i_category IN ('Books',
                        'Sports')
     AND i_manager_id BETWEEN 36 AND 45
     AND wr_return_amt / wr_return_quantity BETWEEN 141 AND 170
     AND wr_reason_sk IN (6,
                          29,
                          42,
                          45,
                          62)
   GROUP BY i_item_id)
SELECT sr_items.item_id,
       sr_item_qty,
       sr_item_qty/(sr_item_qty+cr_item_qty+wr_item_qty)/3.0 * 100 sr_dev,
                                                                    cr_item_qty,
                                                                    cr_item_qty/(sr_item_qty+cr_item_qty+wr_item_qty)/3.0 * 100 cr_dev,
                                                                                                                                 wr_item_qty,
                                                                                                                                 wr_item_qty/(sr_item_qty+cr_item_qty+wr_item_qty)/3.0 * 100 wr_dev,
                                                                                                                                                                                              (sr_item_qty+cr_item_qty+wr_item_qty)/3.0 average
FROM sr_items,
     cr_items,
     wr_items
WHERE sr_items.item_id=cr_items.item_id
  AND sr_items.item_id=wr_items.item_id
ORDER BY sr_items.item_id,
         sr_item_qty
LIMIT 100;