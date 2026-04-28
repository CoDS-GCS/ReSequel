WITH wss AS
  (SELECT d_week_seq,
          ss_store_sk,
          sum(CASE
                  WHEN (d_day_name=&&&_A) THEN ss_sales_price
                  ELSE NULL
              END) sun_sales,
          sum(CASE
                  WHEN (d_day_name=&&&_B) THEN ss_sales_price
                  ELSE NULL
              END) mon_sales,
          sum(CASE
                  WHEN (d_day_name=&&&_C) THEN ss_sales_price
                  ELSE NULL
              END) tue_sales,
          sum(CASE
                  WHEN (d_day_name=&&&_D) THEN ss_sales_price
                  ELSE NULL
              END) wed_sales,
          sum(CASE
                  WHEN (d_day_name=&&&_E) THEN ss_sales_price
                  ELSE NULL
              END) thu_sales,
          sum(CASE
                  WHEN (d_day_name=&&&_F) THEN ss_sales_price
                  ELSE NULL
              END) fri_sales,
          sum(CASE
                  WHEN (d_day_name=&&&_G) THEN ss_sales_price
                  ELSE NULL
              END) sat_sales
   FROM store_sales,
        date_dim
   WHERE d_date_sk = ss_sold_date_sk
     AND ss_sales_price / ss_list_price BETWEEN ###_A * ^^^_A AND ###_B * ^^^_B
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
   FROM wss,
        store,
        date_dim d
   WHERE d.d_week_seq = wss.d_week_seq
     AND ss_store_sk = s_store_sk
     AND d_month_seq BETWEEN ###_C AND ###_D + ###_E
     AND s_state IN N_SSS_A) y,

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
   FROM wss,
        store,
        date_dim d
   WHERE d.d_week_seq = wss.d_week_seq
     AND ss_store_sk = s_store_sk
     AND d_month_seq BETWEEN ###_F+ ###_G AND ###_H + ###_I
     AND s_state IN N_SSS_B) x
WHERE s_store_id1=s_store_id2
  AND d_week_seq1=d_week_seq2-###_J
ORDER BY s_store_name1,
         s_store_id1,
         d_week_seq1
LIMIT ###_K;