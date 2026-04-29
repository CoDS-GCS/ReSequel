WITH ss_sales AS
  (SELECT ca_county,
          SUM(CASE
                  WHEN d_year = 2001
                       AND d_qoy = 1 THEN ss_ext_sales_price
                  ELSE 0
              END) AS store_q1,
          SUM(CASE
                  WHEN d_year = 2001
                       AND d_qoy = 2 THEN ss_ext_sales_price
                  ELSE 0
              END) AS store_q2,
          SUM(CASE
                  WHEN d_year = 2001
                       AND d_qoy = 3 THEN ss_ext_sales_price
                  ELSE 0
              END) AS store_q3
   FROM store_sales,
        date_dim,
        customer_address,
        item
   WHERE ss_sold_date_sk = d_date_sk
     AND ss_addr_sk = ca_address_sk
     AND ss_item_sk = i_item_sk
     AND i_color IN ('purple',
                     'sandy')
     AND i_manager_id BETWEEN 36 AND 55
     AND ss_list_price BETWEEN 77 AND 91
     AND ca_state IN ('GA',
                      'IL')
     AND d_year IN (2001, 2001, 2001)
     AND d_qoy IN (1, 2, 3)
   GROUP BY ca_county),
     ws_sales AS
  (SELECT ca_county,
          SUM(CASE
                  WHEN d_year = 2001
                       AND d_qoy = 1 THEN ws_ext_sales_price
                  ELSE 0
              END) AS web_q1,
          SUM(CASE
                  WHEN d_year = 2001
                       AND d_qoy = 2 THEN ws_ext_sales_price
                  ELSE 0
              END) AS web_q2,
          SUM(CASE
                  WHEN d_year = 2001
                       AND d_qoy = 3 THEN ws_ext_sales_price
                  ELSE 0
              END) AS web_q3
   FROM web_sales,
        date_dim,
        customer_address,
        item
   WHERE ws_sold_date_sk = d_date_sk
     AND ws_bill_addr_sk = ca_address_sk
     AND ws_item_sk = i_item_sk
     AND i_color IN ('purple',
                     'sandy')
     AND i_manager_id BETWEEN 36 AND 55
     AND ws_list_price BETWEEN 77 AND 91
     AND ca_state IN ('GA',
                      'IL')
     AND d_year IN (2001, 2001, 2001)
     AND d_qoy IN (1, 2, 3)
   GROUP BY ca_county)
SELECT COALESCE(ss_sales.ca_county, ws_sales.ca_county) AS ca_county, 2001 AS d_year,
                                                                         ws_sales.web_q2 / ws_sales.web_q1 AS web_q1_q2_increase,
                                                                         ss_sales.store_q2 / ss_sales.store_q1 AS store_q1_q2_increase,
                                                                         ws_sales.web_q3 / ws_sales.web_q2 AS web_q2_q3_increase,
                                                                         ss_sales.store_q3 / ss_sales.store_q2 AS store_q2_q3_increase
FROM ss_sales
FULL OUTER JOIN ws_sales ON ss_sales.ca_county = ws_sales.ca_county
WHERE CASE
          WHEN ws_sales.web_q1 > 0 THEN ws_sales.web_q2 / ws_sales.web_q1
          ELSE NULL
      END > CASE
                WHEN ss_sales.store_q1 > 0 THEN ss_sales.store_q2 / ss_sales.store_q1
                ELSE NULL
            END
  AND CASE
          WHEN ws_sales.web_q2 > 0 THEN ws_sales.web_q3 / ws_sales.web_q2
          ELSE NULL
      END > CASE
                WHEN ss_sales.store_q2 > 0 THEN ss_sales.store_q3 / ss_sales.store_q2
                ELSE NULL
            END
ORDER BY store_q1_q2_increase;