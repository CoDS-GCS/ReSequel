WITH cross_items AS
  (SELECT i_item_sk ss_item_sk
   FROM item,

     (SELECT iss.i_brand_id brand_id,
             iss.i_class_id class_id,
             iss.i_category_id category_id
      FROM store_sales,
           item iss,
           date_dim d1
      WHERE ss_item_sk = iss.i_item_sk
        AND ss_sold_date_sk = d1.d_date_sk
        AND d1.d_year BETWEEN ###_A AND ###_B + ###_C
        AND i_category IN N_SSS_A
        AND i_manager_id BETWEEN ###_D AND ###_E
        AND ss_wholesale_cost BETWEEN ###_F AND ###_G INTERSECT SELECT ics.i_brand_id,
                                                                  ics.i_class_id,
                                                                  ics.i_category_id
      FROM catalog_sales,
           item ics,
           date_dim d2
      WHERE cs_item_sk = ics.i_item_sk
        AND cs_sold_date_sk = d2.d_date_sk
        AND d2.d_year BETWEEN ###_H AND ###_I + ###_J
        AND i_category IN N_SSS_B
        AND i_manager_id BETWEEN ###_K AND ###_L
        AND cs_wholesale_cost BETWEEN ###_M AND ###_N INTERSECT SELECT iws.i_brand_id,
                                                                  iws.i_class_id,
                                                                  iws.i_category_id
      FROM web_sales,
           item iws,
           date_dim d3
      WHERE ws_item_sk = iws.i_item_sk
        AND ws_sold_date_sk = d3.d_date_sk
        AND ws_wholesale_cost BETWEEN ###_O AND ###_P
        AND d3.d_year BETWEEN ###_Q AND ###_R + ###_S) x
   WHERE i_brand_id = brand_id
     AND i_class_id = class_id
     AND i_category_id = category_id
     AND i_category IN N_SSS_C
     AND i_manager_id BETWEEN ###_T AND ###_U),
     avg_sales AS
  (SELECT avg(quantity*list_price) average_sales
   FROM
     (SELECT ss_quantity quantity,
             ss_list_price list_price
      FROM store_sales,
           date_dim
      WHERE ss_sold_date_sk = d_date_sk
        AND d_year BETWEEN ###_V AND ###_W + ###_X
        AND ss_wholesale_cost BETWEEN ###_Y AND ###_Z
      UNION ALL SELECT cs_quantity quantity,
                       cs_list_price list_price
      FROM catalog_sales,
           date_dim
      WHERE cs_sold_date_sk = d_date_sk
        AND d_year BETWEEN ###_AA AND ###_AB + ###_AC
        AND cs_wholesale_cost BETWEEN ###_AD AND ###_AE
      UNION ALL SELECT ws_quantity quantity,
                       ws_list_price list_price
      FROM web_sales,
           date_dim
      WHERE ws_sold_date_sk = d_date_sk
        AND ws_wholesale_cost BETWEEN ###_AF AND ###_AG
        AND d_year BETWEEN ###_AH AND ###_AI + ###_AJ) x)
SELECT this_year.channel ty_channel,
       this_year.i_brand_id ty_brand,
       this_year.i_class_id ty_class,
       this_year.i_category_id ty_category,
       this_year.sales ty_sales,
       this_year.number_sales ty_number_sales,
       last_year.channel ly_channel,
       last_year.i_brand_id ly_brand,
       last_year.i_class_id ly_class,
       last_year.i_category_id ly_category,
       last_year.sales ly_sales,
       last_year.number_sales ly_number_sales
FROM
  (SELECT &&&_A channel,
                  i_brand_id,
                  i_class_id,
                  i_category_id,
                  sum(ss_quantity*ss_list_price) sales,
                  count(*) number_sales
   FROM store_sales,
        item,
        date_dim
   WHERE ss_item_sk IN
       (SELECT ss_item_sk
        FROM cross_items)
     AND ss_item_sk = i_item_sk
     AND ss_sold_date_sk = d_date_sk
     AND d_week_seq =
       (SELECT d_week_seq
        FROM date_dim
        WHERE d_year = ###_AK + ###_AL
          AND d_moy = ###_AM
          AND d_dom = ###_AN)
     AND i_category IN N_SSS_D
     AND i_manager_id BETWEEN ###_AO AND ###_AP
     AND ss_wholesale_cost BETWEEN ###_AQ AND ###_AR
   GROUP BY i_brand_id,
            i_class_id,
            i_category_id
   HAVING sum(ss_quantity*ss_list_price) >
     (SELECT average_sales
      FROM avg_sales)) this_year,

  (SELECT &&&_B channel,
                  i_brand_id,
                  i_class_id,
                  i_category_id,
                  sum(ss_quantity*ss_list_price) sales,
                  count(*) number_sales
   FROM store_sales,
        item,
        date_dim
   WHERE ss_item_sk IN
       (SELECT ss_item_sk
        FROM cross_items)
     AND ss_item_sk = i_item_sk
     AND ss_sold_date_sk = d_date_sk
     AND d_week_seq =
       (SELECT d_week_seq
        FROM date_dim
        WHERE d_year = ###_AS
          AND d_moy = ###_AT
          AND d_dom = ###_AU)
     AND i_category IN N_SSS_E
     AND ss_wholesale_cost BETWEEN ###_AV AND ###_AW
     AND i_manager_id BETWEEN ###_AX AND ###_AY
   GROUP BY i_brand_id,
            i_class_id,
            i_category_id
   HAVING sum(ss_quantity*ss_list_price) >
     (SELECT average_sales
      FROM avg_sales)) last_year
WHERE this_year.i_brand_id= last_year.i_brand_id
  AND this_year.i_class_id = last_year.i_class_id
  AND this_year.i_category_id = last_year.i_category_id
ORDER BY this_year.channel,
         this_year.i_brand_id,
         this_year.i_class_id,
         this_year.i_category_id
LIMIT ###_AZ;