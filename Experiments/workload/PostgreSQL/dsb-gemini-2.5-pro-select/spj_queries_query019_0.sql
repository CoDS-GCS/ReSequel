 
  
  
 WITH filtered_dates AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_year = 2002
     AND d_moy = 8),
     filtered_items AS
  (SELECT i_item_sk,
          i_brand_id,
          i_manufact_id
   FROM item
   WHERE i_category = 'Home'),
     filtered_customers AS MATERIALIZED
  (SELECT c.c_customer_sk, ca.ca_zip
   FROM customer c
   JOIN customer_address ca ON c.c_current_addr_sk = ca.ca_address_sk
   WHERE c.c_birth_month = 4
     AND ca.ca_state = 'GA')
SELECT min(fi.i_brand_id),
       min(fi.i_manufact_id),
       min(ss.ss_ext_sales_price)
FROM store_sales ss
JOIN filtered_dates fd ON ss.ss_sold_date_sk = fd.d_date_sk
JOIN filtered_items fi ON ss.ss_item_sk = fi.i_item_sk
JOIN filtered_customers fc ON ss.ss_customer_sk = fc.c_customer_sk
JOIN store s ON ss.ss_store_sk = s.s_store_sk
WHERE ss.ss_wholesale_cost BETWEEN 80 AND 100
  AND substring(fc.ca_zip, 1, 5) <> substring(s.s_zip, 1, 5);