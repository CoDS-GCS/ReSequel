 
 WITH customer_info AS
  (SELECT c.c_customer_sk,
          c.c_birth_year,
          ca.ca_country,
          ca.ca_state,
          ca.ca_county
   FROM customer c
   JOIN customer_address ca ON c.c_current_addr_sk = ca.ca_address_sk
   WHERE c.c_birth_month = 5)
SELECT i.i_item_id,
       ci.ca_country,
       ci.ca_state,
       ci.ca_county,
       avg(CAST(cs.cs_quantity AS decimal(12, 2))),
       avg(CAST(cs.cs_list_price AS decimal(12, 2))),
       avg(CAST(cs.cs_coupon_amt AS decimal(12, 2))),
       avg(CAST(cs.cs_sales_price AS decimal(12, 2))),
       avg(CAST(cs.cs_net_profit AS decimal(12, 2))),
       avg(CAST(ci.c_birth_year AS decimal(12, 2)))
FROM catalog_sales cs
JOIN item i ON cs.cs_item_sk = i.i_item_sk
JOIN customer_info ci ON cs.cs_bill_customer_sk = ci.c_customer_sk
WHERE cs.cs_wholesale_cost BETWEEN 84 AND 89
  AND i.i_category = 'Jewelry'
  AND ci.ca_state IN ('MT',
                   'OH',
                   'OR')
  AND EXISTS
    (SELECT 1
     FROM date_dim
     WHERE d_date_sk = cs.cs_sold_date_sk
       AND d_year = 2001)
  AND EXISTS
    (SELECT 1
     FROM customer_demographics
     WHERE cd_demo_sk = cs.cs_bill_cdemo_sk
       AND cd_gender = 'F'
       AND cd_education_status = 'College')
GROUP BY ROLLUP (i.i_item_id,
                 ci.ca_country,
                 ci.ca_state,
                 ci.ca_county)
ORDER BY ci.ca_country,
         ci.ca_state,
         ci.ca_county,
         i.i_item_id
LIMIT 100;