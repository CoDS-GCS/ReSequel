SELECT min(i_brand_id),
       min(i_manufact_id),
       min(ss_ext_sales_price)
FROM date_dim,
     store_sales,
     item,
     customer,
     customer_address,
     store
WHERE d_date_sk = ss_sold_date_sk
  AND ss_item_sk = i_item_sk
  AND ss_customer_sk = c_customer_sk
  AND c_current_addr_sk = ca_address_sk
  AND ss_store_sk = s_store_sk
  AND i_category = &&&_A
  AND d_year=###_A
  AND d_moy = ###_B
  AND substring(ca_zip, ###_C, ###_D) <> substring(s_zip, ###_E, ###_F)
  AND ca_state = &&&_B
  AND c_birth_month = ###_G
  AND ss_wholesale_cost BETWEEN ###_H AND ###_I ;