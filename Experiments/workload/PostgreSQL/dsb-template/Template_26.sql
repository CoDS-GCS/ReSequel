SELECT i_item_id,
       ca_country,
       ca_state,
       ca_county,
       avg(cast(cs_quantity AS decimalN_III_A)) agg1,
       avg(cast(cs_list_price AS decimalN_III_B)) agg2,
       avg(cast(cs_coupon_amt AS decimalN_III_C)) agg3,
       avg(cast(cs_sales_price AS decimalN_III_D)) agg4,
       avg(cast(cs_net_profit AS decimalN_III_E)) agg5,
       avg(cast(c_birth_year AS decimalN_III_F)) agg6
FROM catalog_sales,
     customer_demographics,
     customer,
     customer_address,
     date_dim,
     item
WHERE cs_sold_date_sk = d_date_sk
  AND cs_item_sk = i_item_sk
  AND cs_bill_cdemo_sk = cd_demo_sk
  AND cs_bill_customer_sk = c_customer_sk
  AND cd_gender = &&&_A
  AND cd_education_status = &&&_B
  AND c_current_addr_sk = ca_address_sk
  AND d_year = ###_A
  AND c_birth_month = ###_B
  AND ca_state IN N_SSS_A
  AND cs_wholesale_cost BETWEEN ###_C AND ###_D
  AND i_category = &&&_C
GROUP BY ROLLUP (i_item_id,
                 ca_country,
                 ca_state,
                 ca_county)
ORDER BY ca_country,
         ca_state,
         ca_county,
         i_item_id
LIMIT ###_E;