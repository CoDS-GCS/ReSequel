 
 
SELECT cc.cc_call_center_id Call_Center,
       cc.cc_name Call_Center_Name,
       cc.cc_manager Manager,
       sum(cr.cr_net_loss) Returns_Loss
FROM catalog_returns cr
JOIN call_center cc ON cr.cr_call_center_sk = cc.cc_call_center_sk
JOIN customer c ON cr.cr_returning_customer_sk = c.c_customer_sk
JOIN customer_demographics cd ON c.c_current_cdemo_sk = cd.cd_demo_sk
WHERE EXISTS
    (SELECT 1
     FROM date_dim d
     WHERE cr.cr_returned_date_sk = d.d_date_sk
       AND d.d_year = 1999
       AND d.d_moy = 5)
  AND EXISTS
    (SELECT 1
     FROM household_demographics hd
     WHERE c.c_current_hdemo_sk = hd.hd_demo_sk
       AND hd.hd_buy_potential LIKE '0-500%')
  AND EXISTS
    (SELECT 1
     FROM customer_address ca
     WHERE c.c_current_addr_sk = ca.ca_address_sk
       AND ca.ca_gmt_offset = -7)
  AND ((cd.cd_marital_status = 'M'
        AND cd.cd_education_status = 'Unknown')
       OR (cd.cd_marital_status = 'W'
           AND cd.cd_education_status = 'Advanced Degree'))
GROUP BY cc.cc_call_center_id,
         cc.cc_name,
         cc.cc_manager,
         cd.cd_marital_status,
         cd.cd_education_status
ORDER BY sum(cr.cr_net_loss) DESC;