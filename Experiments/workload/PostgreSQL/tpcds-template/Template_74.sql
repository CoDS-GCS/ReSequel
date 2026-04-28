SELECT SUBSTRING(r_reason_desc, 1, 20),
       avg(ws_quantity),
       avg(wr_refunded_cash),
       avg(wr_fee)
FROM web_sales,
     web_returns,
     web_page,
     customer_demographics cd1,
     customer_demographics cd2,
     customer_address,
     date_dim,
     reason
WHERE ws_web_page_sk = wp_web_page_sk
  AND ws_item_sk = wr_item_sk
  AND ws_order_number = wr_order_number
  AND ws_sold_date_sk = d_date_sk
  AND d_year = ###
  AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
  AND cd2.cd_demo_sk = wr_returning_cdemo_sk
  AND ca_address_sk = wr_refunded_addr_sk
  AND r_reason_sk = wr_reason_sk
  AND ((cd1.cd_marital_status = &&&
        AND cd1.cd_marital_status = cd2.cd_marital_status
        AND cd1.cd_education_status = &&&
        AND cd1.cd_education_status = cd2.cd_education_status
        AND ws_sales_price BETWEEN ^^^ AND ^^^)
       OR (cd1.cd_marital_status = &&&
           AND cd1.cd_marital_status = cd2.cd_marital_status
           AND cd1.cd_education_status = &&&
           AND cd1.cd_education_status = cd2.cd_education_status
           AND ws_sales_price BETWEEN ^^^ AND ^^^)
       OR (cd1.cd_marital_status = &&&
           AND cd1.cd_marital_status = cd2.cd_marital_status
           AND cd1.cd_education_status = &&&
           AND cd1.cd_education_status = cd2.cd_education_status
           AND ws_sales_price BETWEEN ^^^ AND ^^^))
  AND ((ca_country = &&&
        AND ca_state IN (N_SSS)
        AND ws_net_profit BETWEEN ### AND ###)
       OR (ca_country = &&&
           AND ca_state IN (N_SSS)
           AND ws_net_profit BETWEEN ### AND ###)
       OR (ca_country = &&&
           AND ca_state IN (N_SSS)
           AND ws_net_profit BETWEEN ### AND ###))
GROUP BY r_reason_desc
ORDER BY SUBSTRING(r_reason_desc, ###, ###),
         avg(ws_quantity),
         avg(wr_refunded_cash),
         avg(wr_fee)
LIMIT ###;