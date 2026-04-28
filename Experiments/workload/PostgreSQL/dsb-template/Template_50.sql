WITH ss AS
  (SELECT ca_county,
          d_qoy,
          d_year,
          sum(ss_ext_sales_price) AS store_sales
   FROM store_sales,
        date_dim,
        customer_address,
        item
   WHERE ss_sold_date_sk = d_date_sk
     AND ss_addr_sk=ca_address_sk
     AND ss_item_sk = i_item_sk
     AND i_color IN N_SSS_A
     AND i_manager_id BETWEEN ###_A AND ###_B
     AND ss_list_price BETWEEN ###_C AND ###_D
     AND ca_state IN N_SSS_B
   GROUP BY ca_county,
            d_qoy,
            d_year),
     ws AS
  (SELECT ca_county,
          d_qoy,
          d_year,
          sum(ws_ext_sales_price) AS web_sales
   FROM web_sales,
        date_dim,
        customer_address,
        item
   WHERE ws_sold_date_sk = d_date_sk
     AND ws_bill_addr_sk=ca_address_sk
     AND ws_item_sk = i_item_sk
     AND i_color IN N_SSS_C
     AND i_manager_id BETWEEN ###_E AND ###_F
     AND ws_list_price BETWEEN ###_G AND ###_H
     AND ca_state IN N_SSS_D
   GROUP BY ca_county,
            d_qoy,
            d_year)
SELECT ss1.ca_county,
       ss1.d_year,
       ws2.web_sales/ws1.web_sales web_q1_q2_increase,
       ss2.store_sales/ss1.store_sales store_q1_q2_increase,
       ws3.web_sales/ws2.web_sales web_q2_q3_increase,
       ss3.store_sales/ss2.store_sales store_q2_q3_increase
FROM ss ss1,
     ss ss2,
     ss ss3,
     ws ws1,
     ws ws2,
     ws ws3
WHERE ss1.d_qoy = ###_I
  AND ss1.d_year = ###_J
  AND ss1.ca_county = ss2.ca_county
  AND ss2.d_qoy = ###_K
  AND ss2.d_year = ###_L
  AND ss2.ca_county = ss3.ca_county
  AND ss3.d_qoy = ###_M
  AND ss3.d_year = ###_N
  AND ss1.ca_county = ws1.ca_county
  AND ws1.d_qoy = ###_O
  AND ws1.d_year = ###_P
  AND ws1.ca_county = ws2.ca_county
  AND ws2.d_qoy = ###_Q
  AND ws2.d_year = ###_R
  AND ws1.ca_county = ws3.ca_county
  AND ws3.d_qoy = ###_S
  AND ws3.d_year =###_T
  AND CASE
          WHEN ws1.web_sales > ###_U THEN ws2.web_sales/ws1.web_sales
          ELSE NULL
      END > CASE
                WHEN ss1.store_sales > ###_V THEN ss2.store_sales/ss1.store_sales
                ELSE NULL
            END
  AND CASE
          WHEN ws2.web_sales > ###_W THEN ws3.web_sales/ws2.web_sales
          ELSE NULL
      END > CASE
                WHEN ss2.store_sales > ###_X THEN ss3.store_sales/ss2.store_sales
                ELSE NULL
            END
ORDER BY store_q1_q2_increase;