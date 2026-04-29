 
  
  
 WITH filtered_dates AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_year = 1998),
     filtered_cd AS
  (SELECT cd_demo_sk,
          cd_marital_status,
          cd_education_status
   FROM customer_demographics
   WHERE cd_marital_status IN ('W', 'S', 'D')
     AND cd_education_status IN ('2 yr Degree', 'College', 'Advanced Degree')),
     filtered_ca AS
  (SELECT ca_address_sk,
          ca_country,
          ca_state
   FROM customer_address
   WHERE (ca_country = 'United States'
          AND ca_state IN ('GA',
                         'IN',
                         'VA'))
     OR (ca_country = 'United States'
         AND ca_state IN ('MT',
                            'NM',
                            'OR'))
     OR (ca_country = 'United States'
         AND ca_state IN ('GA',
                            'IL',
                            'OH')))
SELECT min(ws_quantity),
       min(wr_refunded_cash),
       min(wr_fee),
       min(ws_item_sk),
       min(wr_order_number),
       min(cd1.cd_demo_sk),
       min(cd2.cd_demo_sk)
FROM web_sales
JOIN web_returns ON ws_item_sk = wr_item_sk
AND ws_order_number = wr_order_number
JOIN filtered_dates ON ws_sold_date_sk = d_date_sk
JOIN filtered_cd cd1 ON wr_refunded_cdemo_sk = cd1.cd_demo_sk
JOIN filtered_cd cd2 ON wr_returning_cdemo_sk = cd2.cd_demo_sk
JOIN filtered_ca ON wr_refunded_addr_sk = ca_address_sk
JOIN web_page ON ws_web_page_sk = wp_web_page_sk
JOIN reason ON r_reason_sk = wr_reason_sk
WHERE cd1.cd_marital_status = cd2.cd_marital_status
  AND cd1.cd_education_status = cd2.cd_education_status
  AND ((cd1.cd_marital_status = 'W'
        AND cd1.cd_education_status = '2 yr Degree'
        AND ws_sales_price BETWEEN 100.00 AND 150.00)
       OR (cd1.cd_marital_status = 'S'
           AND cd1.cd_education_status = 'College'
           AND ws_sales_price BETWEEN 50.00 AND 100.00)
       OR (cd1.cd_marital_status = 'D'
           AND cd1.cd_education_status = 'Advanced Degree'
           AND ws_sales_price BETWEEN 150.00 AND 200.00))
  AND ((ca_country = 'United States'
        AND ca_state IN ('GA',
                         'IN',
                         'VA')
        AND ws_net_profit BETWEEN 100 AND 200)
       OR (ca_country = 'United States'
           AND ca_state IN ('MT',
                            'NM',
                            'OR')
           AND ws_net_profit BETWEEN 150 AND 300)
       OR (ca_country = 'United States'
           AND ca_state IN ('GA',
                            'IL',
                            'OH')
           AND ws_net_profit BETWEEN 50 AND 250));