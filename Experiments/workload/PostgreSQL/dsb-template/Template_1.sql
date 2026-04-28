SELECT min(cc_call_center_id),
       min(cc_name),
       min(cc_manager),
       min(cr_net_loss),
       min(cr_item_sk),
       min(cr_order_number)
FROM call_center,
     catalog_returns,
     date_dim,
     customer,
     customer_address,
     customer_demographics,
     household_demographics
WHERE cr_call_center_sk = cc_call_center_sk
  AND cr_returned_date_sk = d_date_sk
  AND cr_returning_customer_sk= c_customer_sk
  AND cd_demo_sk = c_current_cdemo_sk
  AND hd_demo_sk = c_current_hdemo_sk
  AND ca_address_sk = c_current_addr_sk
  AND d_year = ###_A
  AND d_moy = ###_B
  AND ((cd_marital_status = &&&_A
        AND cd_education_status = &&&_B) or(cd_marital_status = &&&_C
                                                AND cd_education_status = &&&_D))
  AND hd_buy_potential like &&&_E
  AND ca_gmt_offset = -###_C ;