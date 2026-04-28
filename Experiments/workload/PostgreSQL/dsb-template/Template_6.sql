SELECT i_item_desc,
       w_warehouse_name,
       d1.d_week_seq,
       sum(CASE
               WHEN p_promo_sk IS NULL THEN ###_A
               ELSE ###_B
           END) no_promo,
       sum(CASE
               WHEN p_promo_sk IS NOT NULL THEN ###_C
               ELSE ###_D
           END) promo,
       count(*) total_cnt
FROM catalog_sales
JOIN inventory ON (cs_item_sk = inv_item_sk)
JOIN warehouse ON (w_warehouse_sk=inv_warehouse_sk)
JOIN item ON (i_item_sk = cs_item_sk)
JOIN customer_demographics ON (cs_bill_cdemo_sk = cd_demo_sk)
JOIN household_demographics ON (cs_bill_hdemo_sk = hd_demo_sk)
JOIN date_dim d1 ON (cs_sold_date_sk = d1.d_date_sk)
JOIN date_dim d2 ON (inv_date_sk = d2.d_date_sk)
JOIN date_dim d3 ON (cs_ship_date_sk = d3.d_date_sk)
LEFT OUTER JOIN promotion ON (cs_promo_sk=p_promo_sk)
LEFT OUTER JOIN catalog_returns ON (cr_item_sk = cs_item_sk
                                    AND cr_order_number = cs_order_number)
WHERE d1.d_week_seq = d2.d_week_seq
  AND inv_quantity_on_hand < cs_quantity
  AND d3.d_date > d1.d_date + interval &&&_A
  AND hd_buy_potential = &&&_B
  AND d1.d_year = ###_E
  AND cd_marital_status = &&&_C
  AND cd_dep_count BETWEEN ###_F AND ###_G
  AND i_category IN N_SSS_A
  AND cs_wholesale_cost BETWEEN ###_H AND ###_I
GROUP BY i_item_desc,
         w_warehouse_name,
         d1.d_week_seq
ORDER BY total_cnt DESC,
         i_item_desc,
         w_warehouse_name,
         d1.d_week_seq
LIMIT ###_J;