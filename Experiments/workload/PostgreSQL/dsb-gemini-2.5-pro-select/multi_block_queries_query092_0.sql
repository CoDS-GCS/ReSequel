WITH avg_discount_per_item AS
  (SELECT ws.ws_item_sk,
          (1.3 * avg(ws.ws_ext_discount_amt)) AS avg_discount_threshold
   FROM web_sales ws
   JOIN date_dim d ON ws.ws_sold_date_sk = d.d_date_sk
   WHERE d.d_date BETWEEN '2002-02-11' AND cast('2002-02-11' AS date) + interval '90 day'
     AND ws.ws_wholesale_cost BETWEEN 68 AND 88
     AND ws.ws_list_price > 0
     AND (ws.ws_sales_price / ws.ws_list_price) BETWEEN 85 * 0.01 AND 100 * 0.01
   GROUP BY ws.ws_item_sk),
     filtered_main_sales AS
  (SELECT ws.ws_item_sk,
          ws.ws_ext_discount_amt
   FROM web_sales ws
   JOIN date_dim d ON ws.ws_sold_date_sk = d.d_date_sk
   WHERE d.d_date BETWEEN '2002-02-11' AND cast('2002-02-11' AS date) + interval '90 day'
     AND ws.ws_wholesale_cost BETWEEN 68 AND 88)
SELECT sum(fms.ws_ext_discount_amt) AS "Excess Discount Amount"
FROM filtered_main_sales fms
JOIN item i ON fms.ws_item_sk = i.i_item_sk
JOIN avg_discount_per_item ad ON fms.ws_item_sk = ad.ws_item_sk
WHERE (i.i_manufact_id BETWEEN 394 AND 593
       OR i.i_category IN ('Books',
                         'Home',
                         'Sports'))
  AND fms.ws_ext_discount_amt > ad.avg_discount_threshold
ORDER BY sum(fms.ws_ext_discount_amt)
LIMIT 100;