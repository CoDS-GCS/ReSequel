SELECT sum(cs_ext_discount_amt) AS "excess discount amount"
FROM catalog_sales,
     item,
     date_dim
WHERE (i_manufact_id IN N_III_A
       OR i_manager_id BETWEEN ###_A AND ###_B)
  AND i_item_sk = cs_item_sk
  AND d_date BETWEEN &&&_A AND cast(&&&_B AS date) + interval &&&_C
  AND d_date_sk = cs_sold_date_sk
  AND cs_ext_discount_amt >
    (SELECT ^^^_A * avg(cs_ext_discount_amt)
     FROM catalog_sales,
          date_dim
     WHERE cs_item_sk = i_item_sk
       AND d_date BETWEEN &&&_D AND cast(&&&_E AS date) + interval &&&_F
       AND d_date_sk = cs_sold_date_sk
       AND cs_list_price BETWEEN ###_C AND ###_D
       AND cs_sales_price / cs_list_price BETWEEN ###_E * ^^^_B AND ###_F * ^^^_C)
ORDER BY sum(cs_ext_discount_amt)
LIMIT ###_G;