 
 WITH ss_addr_filtered AS
  (SELECT ss_quantity,
          ss_ext_sales_price,
          ss_ext_wholesale_cost,
          ss_cdemo_sk,
          ss_hdemo_sk,
          ss_sales_price
   FROM store_sales
   JOIN store ON s_store_sk = ss_store_sk
   JOIN date_dim ON ss_sold_date_sk = d_date_sk
   AND d_year = 2001
   JOIN customer_address ON ss_addr_sk = ca_address_sk
   WHERE ca_country = 'United States'
     AND ca_state IN ('IN', 'NM', 'VA')
     AND ss_net_profit BETWEEN 100 AND 200
   UNION ALL SELECT ss_quantity,
                    ss_ext_sales_price,
                    ss_ext_wholesale_cost,
                    ss_cdemo_sk,
                    ss_hdemo_sk,
                    ss_sales_price
   FROM store_sales
   JOIN store ON s_store_sk = ss_store_sk
   JOIN date_dim ON ss_sold_date_sk = d_date_sk
   AND d_year = 2001
   JOIN customer_address ON ss_addr_sk = ca_address_sk
   WHERE ca_country = 'United States'
     AND ca_state IN ('MT', 'OH', 'OR')
     AND ss_net_profit BETWEEN 150 AND 300
   UNION ALL SELECT ss_quantity,
                    ss_ext_sales_price,
                    ss_ext_wholesale_cost,
                    ss_cdemo_sk,
                    ss_hdemo_sk,
                    ss_sales_price
   FROM store_sales
   JOIN store ON s_store_sk = ss_store_sk
   JOIN date_dim ON ss_sold_date_sk = d_date_sk
   AND d_year = 2001
   JOIN customer_address ON ss_addr_sk = ca_address_sk
   WHERE ca_country = 'United States'
     AND ca_state IN ('GA', 'IL', 'TX')
     AND ss_net_profit BETWEEN 50 AND 250)
SELECT avg(ss_quantity),
       avg(ss_ext_sales_price),
       avg(ss_ext_wholesale_cost),
       sum(ss_ext_wholesale_cost)
FROM ss_addr_filtered
JOIN customer_demographics ON ss_cdemo_sk = cd_demo_sk
JOIN household_demographics ON ss_hdemo_sk = hd_demo_sk
WHERE (cd_marital_status = 'U'
       AND cd_education_status = 'College'
       AND ss_sales_price BETWEEN 100.00 AND 150.00
       AND hd_dep_count = 3)
  OR (cd_marital_status = 'W'
      AND cd_education_status = '2 yr Degree'
      AND ss_sales_price BETWEEN 50.00 AND 100.00
      AND hd_dep_count = 1)
  OR (cd_marital_status = 'S'
      AND cd_education_status = 'College'
      AND ss_sales_price BETWEEN 150.00 AND 200.00
      AND hd_dep_count = 1);