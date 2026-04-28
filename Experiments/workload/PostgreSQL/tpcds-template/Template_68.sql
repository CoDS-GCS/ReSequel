SELECT *
FROM
  (SELECT i_manufact_id,
          sum(ss_sales_price) sum_sales,
          avg(sum(ss_sales_price)) OVER (PARTITION BY i_manufact_id) avg_quarterly_sales
   FROM item,
        store_sales,
        date_dim,
        store
   WHERE ss_item_sk = i_item_sk
     AND ss_sold_date_sk = d_date_sk
     AND ss_store_sk = s_store_sk
     AND d_month_seq IN (###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###,
                         ###)
     AND ((i_category IN (N_SSS)
           AND i_class IN (N_SSS)
           AND i_brand IN (N_SSS)) or(i_category IN (N_SSS)
                                                       AND i_class IN (N_SSS)
                                                       AND i_brand IN (N_SSS)))
   GROUP BY i_manufact_id,
            d_qoy) tmp1
WHERE CASE
          WHEN avg_quarterly_sales > ### THEN ABS (sum_sales - avg_quarterly_sales)/ avg_quarterly_sales
          ELSE NULL
      END > ^^^
ORDER BY avg_quarterly_sales,
         sum_sales,
         i_manufact_id
LIMIT ###;