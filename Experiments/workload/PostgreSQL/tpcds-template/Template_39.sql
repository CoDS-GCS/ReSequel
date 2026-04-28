WITH results AS
  (SELECT sum(ws_net_paid) AS total_sum,
          i_category,
          i_class,
          0 AS g_category,
          0 AS g_class
   FROM web_sales,
        date_dim d1,
        item
   WHERE d1.d_month_seq BETWEEN ### AND ###
     AND d1.d_date_sk = ws_sold_date_sk
     AND i_item_sk = ws_item_sk
   GROUP BY i_category,
            i_class),
     results_rollup AS
  (SELECT total_sum,
          i_category,
          i_class,
          g_category,
          g_class,
          0 AS lochierarchy
   FROM results
   UNION SELECT sum(total_sum) AS total_sum,
                i_category,
                NULL AS i_class,
                0 AS g_category,
                1 AS g_class,
                1 AS lochierarchy
   FROM results
   GROUP BY i_category
   UNION SELECT sum(total_sum) AS total_sum,
                NULL AS i_category,
                NULL AS i_class,
                1 AS g_category,
                1 AS g_class,
                2 AS lochierarchy
   FROM results)
SELECT total_sum,
       i_category,
       i_class,
       lochierarchy,
       rank() OVER (PARTITION BY lochierarchy, CASE
                                                   WHEN g_class = 0 THEN i_category
                                               END
                    ORDER BY total_sum DESC) AS rank_within_parent
FROM results_rollup
ORDER BY lochierarchy DESC,
         CASE
             WHEN lochierarchy = ### THEN i_category
         END,
         rank_within_parent
LIMIT ###;