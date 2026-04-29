 
 WITH d1_filtered AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_moy = 6
     AND d_year = 2000),
     d2_filtered AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_year = 2000
     AND d_moy BETWEEN 6 AND 6 + 2),
     d3_filtered AS
  (SELECT d_date_sk
   FROM date_dim
   WHERE d_year = 2000
     AND d_moy BETWEEN 6 AND 6 + 2),
     ss_sr_joined AS
  (SELECT ss.ss_item_sk,
          ss.ss_customer_sk,
          ss.ss_net_profit,
          sr.sr_net_loss,
          sr.sr_ticket_number,
          i.i_item_id,
          i.i_item_desc,
          s.s_store_id,
          s.s_store_name
   FROM store_sales ss
   JOIN d1_filtered ON ss.ss_sold_date_sk = d1_filtered.d_date_sk
   JOIN store_returns sr ON ss.ss_customer_sk = sr.sr_customer_sk
   AND ss.ss_item_sk = sr.sr_item_sk
   AND ss.ss_ticket_number = sr.sr_ticket_number
   JOIN d2_filtered ON sr.sr_returned_date_sk = d2_filtered.d_date_sk
   JOIN item i ON ss.ss_item_sk = i.i_item_sk
   JOIN store s ON ss.ss_store_sk = s.s_store_sk)
SELECT min(j.i_item_id),
       min(j.i_item_desc),
       min(j.s_store_id),
       min(j.s_store_name),
       min(j.ss_net_profit),
       min(j.sr_net_loss),
       min(cs.cs_net_profit),
       min(j.ss_item_sk),
       min(j.sr_ticket_number),
       min(cs.cs_order_number)
FROM ss_sr_joined j
JOIN catalog_sales cs ON j.ss_customer_sk = cs.cs_bill_customer_sk
AND j.ss_item_sk = cs.cs_item_sk
JOIN d3_filtered ON cs.cs_sold_date_sk = d3_filtered.d_date_sk;