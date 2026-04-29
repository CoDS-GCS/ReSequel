 
 
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
FROM
  (SELECT inv.inv_warehouse_sk AS w_warehouse_sk,
          inv.inv_item_sk AS i_item_sk,
          d.d_moy,
          avg(inv.inv_quantity_on_hand) AS mean,
          stddev_samp(inv.inv_quantity_on_hand) / NULLIF(avg(inv.inv_quantity_on_hand), 0) AS cov
   FROM inventory inv
   JOIN date_dim d ON inv.inv_date_sk = d.d_date_sk
   JOIN item i ON inv.inv_item_sk = i.i_item_sk
   WHERE d.d_year = 1998
     AND d.d_moy = 2
     AND i.i_category IN ('Books',
                           'Home')
     AND i.i_manager_id BETWEEN 28 AND 47
     AND inv.inv_quantity_on_hand BETWEEN 225 AND 425
   GROUP BY inv.inv_warehouse_sk,
            inv.inv_item_sk,
            d.d_moy
   HAVING (stddev_samp(inv.inv_quantity_on_hand) / NULLIF(avg(inv.inv_quantity_on_hand), 0)) > 1
   AND (stddev_samp(inv.inv_quantity_on_hand) / NULLIF(avg(inv.inv_quantity_on_hand), 0)) > 1.5) inv1
JOIN
  (SELECT inv.inv_warehouse_sk AS w_warehouse_sk,
          inv.inv_item_sk AS i_item_sk,
          d.d_moy,
          avg(inv.inv_quantity_on_hand) AS mean,
          stddev_samp(inv.inv_quantity_on_hand) / NULLIF(avg(inv.inv_quantity_on_hand), 0) AS cov
   FROM inventory inv
   JOIN date_dim d ON inv.inv_date_sk = d.d_date_sk
   JOIN item i ON inv.inv_item_sk = i.i_item_sk
   WHERE d.d_year = 1998
     AND d.d_moy = 2 + 1
     AND i.i_category IN ('Books',
                           'Home')
     AND i.i_manager_id BETWEEN 28 AND 47
     AND inv.inv_quantity_on_hand BETWEEN 225 AND 425
   GROUP BY inv.inv_warehouse_sk,
            inv.inv_item_sk,
            d.d_moy
   HAVING (stddev_samp(inv.inv_quantity_on_hand) / NULLIF(avg(inv.inv_quantity_on_hand), 0)) > 1) inv2 ON inv1.i_item_sk = inv2.i_item_sk
AND inv1.w_warehouse_sk = inv2.w_warehouse_sk
ORDER BY inv1.w_warehouse_sk,
         inv1.i_item_sk,
         inv1.d_moy,
         inv1.mean,
         inv1.cov,
         inv2.d_moy,
         inv2.mean,
         inv2.cov;