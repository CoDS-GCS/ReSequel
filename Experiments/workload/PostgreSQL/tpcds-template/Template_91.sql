SELECT cc_call_center_id Call_Center,
       cc_name Call_Center_Name,
       cc_manager Manager,
       sum(cr_net_loss) Returns_Loss
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
  AND d_year = ###
  AND d_moy = ###
  AND ((cd_marital_status = &&&
        AND cd_education_status = &&&) or(cd_marital_status = &&&
                                                AND cd_education_status = &&&))
  AND hd_buy_potential LIKE &&&
  AND ca_gmt_offset = ###
GROUP BY cc_call_center_id,
         cc_name,
         cc_manager,
         cd_marital_status,
         cd_education_status
ORDER BY sum(cr_net_loss) DESC;