 
 WITH wss AS
  (SELECT d_week_seq,
          ss_store_sk,
          sum(CASE
                  WHEN (d_day_name='Sunday') THEN ss_sales_price
                  ELSE NULL
              END) sun_sales,
          sum(CASE
                  WHEN (d_day_name='Monday') THEN ss_sales_price
                  ELSE NULL
              END) mon_sales,
          sum(CASE
                  WHEN (d_day_name='Tuesday') THEN ss_sales_price
                  ELSE NULL
              END) tue_sales,
          sum(CASE
                  WHEN (d_day_name='Wednesday') THEN ss_sales_price
                  ELSE NULL
              END) wed_sales,
          sum(CASE
                  WHEN (d_day_name='Thursday') THEN ss_sales_price
                  ELSE NULL
              END) thu_sales,
          sum(CASE
                  WHEN (d_day_name='Friday') THEN ss_sales_price
                  ELSE NULL
              END) fri_sales,
          sum(CASE
                  WHEN (d_day_name='Saturday') THEN ss_sales_price
                  ELSE NULL
              END) sat_sales
   FROM store_sales
   JOIN date_dim ON d_date_sk = ss_sold_date_sk
   WHERE ss_list_price > 0
     AND (ss_sales_price / ss_list_price) BETWEEN 17 * 0.01 AND 37 * 0.01
     AND (d_month_seq BETWEEN 1207 AND 1207 + 11
          OR d_month_seq BETWEEN 1207 + 12 AND 1207 + 23)
   GROUP BY d_week_seq,
            ss_store_sk)
SELECT s_store_name1,
       s_store_id1,
       d_week_seq1,
       sun_sales1/sun_sales2,
       mon_sales1/mon_sales2,
       tue_sales1/tue_sales2,
       wed_sales1/wed_sales2,
       thu_sales1/thu_sales2,
       fri_sales1/fri_sales2,
       sat_sales1/sat_sales2
FROM
  (SELECT s_store_name s_store_name1,
          wss.d_week_seq d_week_seq1,
          s_store_id s_store_id1,
          sun_sales sun_sales1,
          mon_sales mon_sales1,
          tue_sales tue_sales1,
          wed_sales wed_sales1,
          thu_sales thu_sales1,
          fri_sales fri_sales1,
          sat_sales sat_sales1
   FROM wss
   JOIN store ON ss_store_sk = s_store_sk
   JOIN date_dim d ON d.d_week_seq = wss.d_week_seq
   WHERE d_month_seq BETWEEN 1207 AND 1207 + 11
     AND s_state IN ('GA',
                     'IL',
                     'IN',
                     'MT',
                     'NM',
                     'OH',
                     'OR',
                     'TX')) y
JOIN
  (SELECT s_store_name s_store_name2,
          wss.d_week_seq d_week_seq2,
          s_store_id s_store_id2,
          sun_sales sun_sales2,
          mon_sales mon_sales2,
          tue_sales tue_sales2,
          wed_sales wed_sales2,
          thu_sales thu_sales2,
          fri_sales fri_sales2,
          sat_sales sat_sales2
   FROM wss
   JOIN store ON ss_store_sk = s_store_sk
   JOIN date_dim d ON d.d_week_seq = wss.d_week_seq
   WHERE d_month_seq BETWEEN 1207+ 12 AND 1207 + 23
     AND s_state IN ('GA',
                     'IL',
                     'IN',
                     'MT',
                     'NM',
                     'OH',
                     'OR',
                     'TX')) x ON s_store_id1=s_store_id2
AND d_week_seq1=d_week_seq2-52
ORDER BY s_store_name1,
         s_store_id1,
         d_week_seq1
LIMIT 100;