SELECT substring(r_reason_desc, ###_A, ###_B),
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
  AND d_year = ###_C
  AND cd1.cd_demo_sk = wr_refunded_cdemo_sk
  AND cd2.cd_demo_sk = wr_returning_cdemo_sk
  AND ca_address_sk = wr_refunded_addr_sk
  AND r_reason_sk = wr_reason_sk
  AND ((cd1.cd_marital_status = &&&_A
        AND cd1.cd_marital_status = cd2.cd_marital_status
        AND cd1.cd_education_status = &&&_B
        AND cd1.cd_education_status = cd2.cd_education_status
        AND ws_sales_price BETWEEN ^^^_A AND ^^^_B)
       OR (cd1.cd_marital_status = &&&_C
           AND cd1.cd_marital_status = cd2.cd_marital_status
           AND cd1.cd_education_status = &&&_D
           AND cd1.cd_education_status = cd2.cd_education_status
           AND ws_sales_price BETWEEN ^^^_C AND ^^^_D)
       OR (cd1.cd_marital_status = &&&_E
           AND cd1.cd_marital_status = cd2.cd_marital_status
           AND cd1.cd_education_status = &&&_F
           AND cd1.cd_education_status = cd2.cd_education_status
           AND ws_sales_price BETWEEN ^^^_E AND ^^^_F))
  AND ((ca_country = &&&_G
        AND ca_state IN N_SSS_A
        AND ws_net_profit BETWEEN ###_D AND ###_E)
       OR (ca_country = &&&_H
           AND ca_state IN N_SSS_B
           AND ws_net_profit BETWEEN ###_F AND ###_G)
       OR (ca_country = &&&_I
           AND ca_state IN N_SSS_C
           AND ws_net_profit BETWEEN ###_H AND ###_I))
GROUP BY r_reason_desc
ORDER BY substring(r_reason_desc, ###_J, ###_K),
         avg(ws_quantity),
         avg(wr_refunded_cash),
         avg(wr_fee)
LIMIT ###_L;