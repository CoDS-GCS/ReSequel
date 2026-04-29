 
 WITH sr_cs_items AS
  (SELECT sr.sr_customer_sk,
          sr.sr_item_sk,
          sr.sr_ticket_number,
          sum(sr.sr_net_loss) AS store_returns_loss,
          sum(cs.cs_net_profit) AS catalog_sales_profit
   FROM store_returns sr
   JOIN date_dim d2 ON sr.sr_returned_date_sk = d2.d_date_sk
   JOIN catalog_sales cs ON sr.sr_customer_sk = cs.cs_bill_customer_sk
   AND sr.sr_item_sk = cs.cs_item_sk
   JOIN date_dim d3 ON cs.cs_sold_date_sk = d3.d_date_sk
   WHERE d2.d_year = 2001
     AND d2.d_moy BETWEEN 8 AND 8 + 2
     AND d3.d_year = 2001
     AND d3.d_moy BETWEEN 8 AND 8 + 2
   GROUP BY sr.sr_customer_sk,
            sr.sr_item_sk,
            sr.sr_ticket_number)
SELECT i.i_item_id,
       i.i_item_desc,
       s.s_store_id,
       s.s_store_name,
       sum(ss.ss_net_profit) AS store_sales_profit,
       sum(sr_cs.store_returns_loss) AS store_returns_loss,
       sum(sr_cs.catalog_sales_profit) AS catalog_sales_profit
FROM store_sales ss
JOIN date_dim d1 ON ss.ss_sold_date_sk = d1.d_date_sk
JOIN store s ON ss.ss_store_sk = s.s_store_sk
JOIN item i ON ss.ss_item_sk = i.i_item_sk
JOIN sr_cs_items sr_cs ON ss.ss_customer_sk = sr_cs.sr_customer_sk
AND ss.ss_item_sk = sr_cs.sr_item_sk
AND ss.ss_ticket_number = sr_cs.sr_ticket_number
WHERE d1.d_moy = 8
  AND d1.d_year = 2001
GROUP BY i.i_item_id,
         i.i_item_desc,
         s.s_store_id,
         s.s_store_name
ORDER BY i.i_item_id,
         i.i_item_desc,
         s.s_store_id,
         s.s_store_name
LIMIT 100;