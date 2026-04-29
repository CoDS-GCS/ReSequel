WITH store_level_returns AS
  (SELECT ss.ss_store_sk,
          sum(CASE
                  WHEN ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) <= 30) THEN 1
                  ELSE 0
              END) AS days_30,
          sum(CASE
                  WHEN ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) > 30)
                       AND ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) <= 60) THEN 1
                  ELSE 0
              END) AS days_60,
          sum(CASE
                  WHEN ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) > 60)
                       AND ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) <= 90) THEN 1
                  ELSE 0
              END) AS days_90,
          sum(CASE
                  WHEN ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) > 90)
                       AND ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) <= 120) THEN 1
                  ELSE 0
              END) AS days_120,
          sum(CASE
                  WHEN ((sr.sr_returned_date_sk - ss.ss_sold_date_sk) > 120) THEN 1
                  ELSE 0
              END) AS days_over_120
   FROM store_sales ss
   JOIN store_returns sr ON ss.ss_ticket_number = sr.sr_ticket_number
   AND ss.ss_item_sk = sr.sr_item_sk
   AND ss.ss_customer_sk = sr.sr_customer_sk
   JOIN date_dim d2 ON sr.sr_returned_date_sk = d2.d_date_sk
   JOIN date_dim d1 ON ss.ss_sold_date_sk = d1.d_date_sk
   WHERE d2.d_year = 2000
     AND d2.d_moy = 4
     AND d1.d_date BETWEEN (d2.d_date - interval '120 day') AND d2.d_date
   GROUP BY ss.ss_store_sk)
SELECT s.s_store_name,
       s.s_company_id,
       s.s_street_number,
       s.s_street_name,
       s.s_street_type,
       s.s_suite_number,
       s.s_city,
       s.s_county,
       s.s_state,
       s.s_zip,
       slr.days_30 AS "30 days",
       slr.days_60 AS "31-60 days",
       slr.days_90 AS "61-90 days",
       slr.days_120 AS "91-120 days",
       slr.days_over_120 AS ">120 days"
FROM store_level_returns slr
JOIN store s ON slr.ss_store_sk = s.s_store_sk
ORDER BY s_store_name,
         s_company_id,
         s_street_number,
         s_street_name,
         s_street_type,
         s_suite_number,
         s_city,
         s_county,
         s_state,
         s_zip
LIMIT 100;