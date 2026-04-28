WITH ssr AS
  (SELECT s_store_id AS store_id,
          sum(ss_ext_sales_price) AS sales,
          sum(coalesce(sr_return_amt, ###_A)) AS RETURNS,
          sum(ss_net_profit - coalesce(sr_net_loss, ###_B)) AS profit
   FROM store_sales
   LEFT OUTER JOIN store_returns ON (ss_item_sk = sr_item_sk
                                     AND ss_ticket_number = sr_ticket_number), date_dim,
                                                                               store,
                                                                               item,
                                                                               promotion
   WHERE ss_sold_date_sk = d_date_sk
     AND d_date BETWEEN cast(&&&_A AS date) AND cast(&&&_B AS date) + interval &&&_C
     AND ss_store_sk = s_store_sk
     AND ss_item_sk = i_item_sk
     AND i_current_price > ###_C
     AND ss_promo_sk = p_promo_sk
     AND p_channel_email = &&&_D
     AND p_channel_tv = &&&_E
     AND p_channel_radio = &&&_F
     AND p_channel_press = &&&_G
     AND p_channel_event = &&&_H
     AND ss_wholesale_cost BETWEEN ###_D AND ###_E
     AND i_category IN N_SSS_A
   GROUP BY s_store_id),
     csr AS
  (SELECT cp_catalog_page_id AS catalog_page_id,
          sum(cs_ext_sales_price) AS sales,
          sum(coalesce(cr_return_amount, ###_F)) AS RETURNS,
          sum(cs_net_profit - coalesce(cr_net_loss, ###_G)) AS profit
   FROM catalog_sales
   LEFT OUTER JOIN catalog_returns ON (cs_item_sk = cr_item_sk
                                       AND cs_order_number = cr_order_number), date_dim,
                                                                               catalog_page,
                                                                               item,
                                                                               promotion
   WHERE cs_sold_date_sk = d_date_sk
     AND d_date BETWEEN cast(&&&_I AS date) AND cast(&&&_J AS date) + interval &&&_K
     AND cs_catalog_page_sk = cp_catalog_page_sk
     AND cs_item_sk = i_item_sk
     AND i_current_price > ###_H
     AND cs_promo_sk = p_promo_sk
     AND p_channel_email = &&&_L
     AND p_channel_tv = &&&_M
     AND p_channel_radio = &&&_N
     AND p_channel_press = &&&_O
     AND p_channel_event = &&&_P
     AND cs_wholesale_cost BETWEEN ###_I AND ###_J
     AND i_category IN N_SSS_B
   GROUP BY cp_catalog_page_id),
     wsr AS
  (SELECT web_site_id,
          sum(ws_ext_sales_price) AS sales,
          sum(coalesce(wr_return_amt, ###_K)) AS RETURNS,
          sum(ws_net_profit - coalesce(wr_net_loss, ###_L)) AS profit
   FROM web_sales
   LEFT OUTER JOIN web_returns ON (ws_item_sk = wr_item_sk
                                   AND ws_order_number = wr_order_number), date_dim,
                                                                           web_site,
                                                                           item,
                                                                           promotion
   WHERE ws_sold_date_sk = d_date_sk
     AND d_date BETWEEN cast(&&&_Q AS date) AND cast(&&&_R AS date) + interval &&&_S
     AND ws_web_site_sk = web_site_sk
     AND ws_item_sk = i_item_sk
     AND i_current_price > ###_M
     AND ws_promo_sk = p_promo_sk
     AND p_channel_email = &&&_T
     AND p_channel_tv = &&&_U
     AND p_channel_radio = &&&_V
     AND p_channel_press = &&&_W
     AND p_channel_event = &&&_X
     AND ws_wholesale_cost BETWEEN ###_N AND ###_O
     AND i_category IN N_SSS_C
   GROUP BY web_site_id)
SELECT channel,
       id,
       sum(sales) AS sales,
       sum(RETURNS) AS RETURNS,
       sum(profit) AS profit
FROM
  (SELECT &&&_Y AS channel,
          &&&_Z || store_id AS id,
          sales,
          RETURNS,
          profit
   FROM ssr
   UNION ALL SELECT &&&_AA AS channel,
                    &&&_AB || catalog_page_id AS id,
                    sales,
                    RETURNS,
                    profit
   FROM csr
   UNION ALL SELECT &&&_AC AS channel,
                    &&&_AD || web_site_id AS id,
                    sales,
                    RETURNS,
                    profit
   FROM wsr) x
GROUP BY ROLLUP (channel,
                 id)
ORDER BY channel,
         id
LIMIT ###_P;