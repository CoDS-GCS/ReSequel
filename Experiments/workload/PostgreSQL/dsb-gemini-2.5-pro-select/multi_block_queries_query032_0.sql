WITH avg_discount_per_item AS
  (SELECT cs_item_sk, 1.3 * avg(cs_ext_discount_amt) AS threshold
   FROM catalog_sales
   JOIN date_dim ON cs_sold_date_sk = d_date_sk
   WHERE d_date BETWEEN '1999-01-14' AND cast('1999-01-14' AS date) + interval '90 day'
     AND cs_list_price BETWEEN 236 AND 265
     AND cs_sales_price / cs_list_price BETWEEN 45 * 0.01 AND 65 * 0.01
   GROUP BY cs_item_sk)
SELECT sum(cs.cs_ext_discount_amt) AS "excess discount amount"
FROM catalog_sales cs
JOIN item i ON cs.cs_item_sk = i.i_item_sk
JOIN date_dim d ON cs.cs_sold_date_sk = d.d_date_sk
JOIN avg_discount_per_item adpi ON i.i_item_sk = adpi.cs_item_sk
WHERE (i.i_manufact_id IN (117,
                         306,
                         658,
                         849,
                         891)
       OR i.i_manager_id BETWEEN 28 AND 57)
  AND d.d_date BETWEEN '1999-01-14' AND cast('1999-01-14' AS date) + interval '90 day'
  AND cs.cs_ext_discount_amt > adpi.threshold
ORDER BY sum(cs.cs_ext_discount_amt)
LIMIT 100;