 
  
  
 WITH filtered_cd AS
  (SELECT cd_demo_sk
   FROM customer_demographics
   WHERE cd_gender = 'M'
     AND cd_marital_status = 'S'
     AND cd_education_status = 'College'),
     filtered_d AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_year = 2002)
SELECT min(i.i_item_id),
       min(s.s_state),
       min(ss.ss_quantity),
       min(ss.ss_list_price),
       min(ss.ss_coupon_amt),
       min(ss.ss_sales_price),
       min(ss.ss_item_sk),
       min(ss.ss_ticket_number)
FROM store_sales ss
JOIN item i ON ss.ss_item_sk = i.i_item_sk
JOIN store s ON ss.ss_store_sk = s.s_store_sk
JOIN filtered_cd fcd ON ss.ss_cdemo_sk = fcd.cd_demo_sk
JOIN filtered_d fd ON ss.ss_sold_date_sk = fd.d_date_sk
WHERE i.i_category = 'Jewelry'
  AND s.s_state = 'IL';