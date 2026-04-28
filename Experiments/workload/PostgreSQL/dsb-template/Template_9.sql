WITH inv AS
  (SELECT w_warehouse_name,
          w_warehouse_sk,
          i_item_sk,
          d_moy,
          stdev,
          mean,
          CASE mean
              WHEN ###_A THEN NULL
              ELSE stdev/mean
          END cov
   FROM
     (SELECT w_warehouse_name,
             w_warehouse_sk,
             i_item_sk,
             d_moy,
             stddev_samp(inv_quantity_on_hand) stdev,
             avg(inv_quantity_on_hand) mean
      FROM inventory,
           item,
           warehouse,
           date_dim
      WHERE inv_item_sk = i_item_sk
        AND inv_warehouse_sk = w_warehouse_sk
        AND inv_date_sk = d_date_sk
        AND d_year =###_B
        AND i_category IN N_SSS_A
        AND i_manager_id BETWEEN ###_C AND ###_D
        AND inv_quantity_on_hand BETWEEN ###_E AND ###_F
      GROUP BY w_warehouse_name,
               w_warehouse_sk,
               i_item_sk,
               d_moy) foo
   WHERE CASE mean
             WHEN ###_G THEN ###_H
             ELSE stdev/mean
         END > ###_I)
SELECT inv1.w_warehouse_sk,
       inv1.i_item_sk,
       inv1.d_moy,
       inv1.mean,
       inv1.cov,
       inv2.w_warehouse_sk,
       inv2.i_item_sk,
       inv2.d_moy,
       inv2.mean,
       inv2.cov
FROM inv inv1,
     inv inv2
WHERE inv1.i_item_sk = inv2.i_item_sk
  AND inv1.w_warehouse_sk = inv2.w_warehouse_sk
  AND inv1.d_moy=###_J
  AND inv2.d_moy=###_K+###_L
ORDER BY inv1.w_warehouse_sk,
         inv1.i_item_sk,
         inv1.d_moy,
         inv1.mean,
         inv1.cov,
         inv2.d_moy,
         inv2.mean,
         inv2.cov ;

WITH inv AS
  (SELECT w_warehouse_name,
          w_warehouse_sk,
          i_item_sk,
          d_moy,
          stdev,
          mean,
          CASE mean
              WHEN ###_M THEN NULL
              ELSE stdev/mean
          END cov
   FROM
     (SELECT w_warehouse_name,
             w_warehouse_sk,
             i_item_sk,
             d_moy,
             stddev_samp(inv_quantity_on_hand) stdev,
             avg(inv_quantity_on_hand) mean
      FROM inventory,
           item,
           warehouse,
           date_dim
      WHERE inv_item_sk = i_item_sk
        AND inv_warehouse_sk = w_warehouse_sk
        AND inv_date_sk = d_date_sk
        AND d_year =###_N
        AND i_category IN N_SSS_B
        AND i_manager_id BETWEEN ###_O AND ###_P
        AND inv_quantity_on_hand BETWEEN ###_Q AND ###_R
      GROUP BY w_warehouse_name,
               w_warehouse_sk,
               i_item_sk,
               d_moy) foo
   WHERE CASE mean
             WHEN ###_S THEN ###_T
             ELSE stdev/mean
         END > ###_U)
SELECT inv1.w_warehouse_sk,
       inv1.i_item_sk,
       inv1.d_moy,
       inv1.mean,
       inv1.cov,
       inv2.w_warehouse_sk,
       inv2.i_item_sk,
       inv2.d_moy,
       inv2.mean,
       inv2.cov
FROM inv inv1,
     inv inv2
WHERE inv1.i_item_sk = inv2.i_item_sk
  AND inv1.w_warehouse_sk = inv2.w_warehouse_sk
  AND inv1.d_moy=###_V
  AND inv2.d_moy=###_W+###_X
  AND inv1.cov > ^^^_A
ORDER BY inv1.w_warehouse_sk,
         inv1.i_item_sk,
         inv1.d_moy,
         inv1.mean,
         inv1.cov,
         inv2.d_moy,
         inv2.mean,
         inv2.cov ;