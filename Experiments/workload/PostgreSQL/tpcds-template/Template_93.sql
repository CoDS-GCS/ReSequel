SELECT i_brand_id brand_id,
       i_brand brand,
       t_hour,
       t_minute,
       sum(ext_price) ext_price
FROM item,

  (SELECT ws_ext_sales_price AS ext_price,
          ws_sold_date_sk AS sold_date_sk,
          ws_item_sk AS sold_item_sk,
          ws_sold_time_sk AS time_sk
   FROM web_sales,
        date_dim
   WHERE d_date_sk = ws_sold_date_sk
     AND d_moy=###
     AND d_year=###
   UNION ALL SELECT cs_ext_sales_price AS ext_price,
                    cs_sold_date_sk AS sold_date_sk,
                    cs_item_sk AS sold_item_sk,
                    cs_sold_time_sk AS time_sk
   FROM catalog_sales,
        date_dim
   WHERE d_date_sk = cs_sold_date_sk
     AND d_moy=###
     AND d_year=###
   UNION ALL SELECT ss_ext_sales_price AS ext_price,
                    ss_sold_date_sk AS sold_date_sk,
                    ss_item_sk AS sold_item_sk,
                    ss_sold_time_sk AS time_sk
   FROM store_sales,
        date_dim
   WHERE d_date_sk = ss_sold_date_sk
     AND d_moy=###
     AND d_year=###) tmp,
     time_dim
WHERE sold_item_sk = i_item_sk
  AND i_manager_id=###
  AND time_sk = t_time_sk
  AND (t_meal_time = &&&
       OR t_meal_time = &&&)
GROUP BY i_brand,
         i_brand_id,
         t_hour,
         t_minute
ORDER BY ext_price DESC,
         i_brand_id ;