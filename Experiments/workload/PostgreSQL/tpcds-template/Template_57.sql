SELECT i_item_id,
       avg(ss_quantity) agg1,
       avg(ss_list_price) agg2,
       avg(ss_coupon_amt) agg3,
       avg(ss_sales_price) agg4
FROM store_sales,
     customer_demographics,
     date_dim,
     item,
     promotion
WHERE ss_sold_date_sk = d_date_sk
  AND ss_item_sk = i_item_sk
  AND ss_cdemo_sk = cd_demo_sk
  AND ss_promo_sk = p_promo_sk
  AND cd_gender = &&&
  AND cd_marital_status = &&&
  AND cd_education_status = &&&
  AND (p_channel_email = &&&
       OR p_channel_event = &&&)
  AND d_year = ###
GROUP BY i_item_id
ORDER BY i_item_id
LIMIT ###;