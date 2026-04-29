 
  
  
 WITH sales_base AS
  (SELECT ss_ticket_number,
          ss_item_sk,
          ss_list_price
   FROM store_sales
   JOIN date_dim ON ss_sold_date_sk = d_date_sk
   JOIN customer ON ss_customer_sk = c_customer_sk
   JOIN customer_demographics ON c_current_cdemo_sk = cd_demo_sk
   JOIN customer_address ON c_current_addr_sk = ca_address_sk
   WHERE d_year BETWEEN 1998 AND 1998 + 1
     AND cd_marital_status = 'W'
     AND cd_education_status = 'Primary'),
     item1_sales AS
  (SELECT s.ss_ticket_number,
          i.i_item_sk
   FROM sales_base s
   JOIN item i ON s.ss_item_sk = i.i_item_sk
   WHERE s.ss_list_price BETWEEN 236 AND 250
     AND i.i_category IN ('Jewelry',
                           'Music')),
     item2_sales AS
  (SELECT s.ss_ticket_number,
          i.i_item_sk
   FROM store_sales s
   JOIN item i ON s.ss_item_sk = i.i_item_sk
   WHERE s.ss_list_price BETWEEN 236 AND 250
     AND i.i_manager_id BETWEEN 77 AND 96)
SELECT min(s1.i_item_sk),
       min(s2.i_item_sk),
       min(s1.ss_ticket_number),
       min(s1.i_item_sk)
FROM item1_sales s1
JOIN item2_sales s2 ON s1.ss_ticket_number = s2.ss_ticket_number
WHERE s1.i_item_sk < s2.i_item_sk;