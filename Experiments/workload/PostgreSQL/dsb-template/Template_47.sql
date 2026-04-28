SELECT item1.i_item_sk,
       item2.i_item_sk,
       count(*) AS cnt
FROM item AS item1,
     item AS item2,
     store_sales AS s1,
     store_sales AS s2,
     date_dim,
     customer,
     customer_address,
     customer_demographics
WHERE item1.i_item_sk < item2.i_item_sk
  AND s1.ss_ticket_number = s2.ss_ticket_number
  AND s1.ss_item_sk = item1.i_item_sk
  AND s2.ss_item_sk = item2.i_item_sk
  AND s1.ss_customer_sk = c_customer_sk
  AND c_current_addr_sk = ca_address_sk
  AND c_current_cdemo_sk = cd_demo_sk
  AND d_year BETWEEN ###_A AND ###_B + ###_C
  AND d_date_sk = s1.ss_sold_date_sk
  AND item1.i_category IN N_SSS_A
  AND item2.i_manager_id BETWEEN ###_D AND ###_E
  AND cd_marital_status = &&&_A
  AND cd_education_status = &&&_B
  AND s1.ss_list_price BETWEEN ###_F AND ###_G
  AND s2.ss_list_price BETWEEN ###_H AND ###_I
GROUP BY item1.i_item_sk,
         item2.i_item_sk
ORDER BY cnt ;