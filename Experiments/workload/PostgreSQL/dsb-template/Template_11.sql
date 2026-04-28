SELECT count(DISTINCT ws_order_number) AS "order count",
       sum(ws_ext_ship_cost) AS "total shipping cost",
       sum(ws_net_profit) AS "total net profit"
FROM web_sales ws1,
     date_dim,
     customer_address,
     web_site
WHERE d_date BETWEEN &&&_A AND cast(&&&_B AS date) + interval &&&_C
  AND ws1.ws_ship_date_sk = d_date_sk
  AND ws1.ws_ship_addr_sk = ca_address_sk
  AND ca_state IN N_SSS_A
  AND ws1.ws_web_site_sk = web_site_sk
  AND web_gmt_offset >= -###_A
  AND ws1.ws_list_price BETWEEN ###_B AND ###_C
  AND EXISTS
    (SELECT *
     FROM web_sales ws2
     WHERE ws1.ws_order_number = ws2.ws_order_number
       AND ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
  AND NOT exists
    (SELECT *
     FROM web_returns wr1
     WHERE ws1.ws_order_number = wr1.wr_order_number
       AND wr1.wr_reason_sk IN N_III_A)
ORDER BY count(DISTINCT ws_order_number)
LIMIT ###_D;