SELECT min(ss_quantity),
       min(ss_ext_sales_price),
       min(ss_ext_wholesale_cost),
       min(ss_ext_wholesale_cost)
FROM store_sales,
     store,
     customer_demographics,
     household_demographics,
     customer_address,
     date_dim
WHERE s_store_sk = ss_store_sk
  AND ss_sold_date_sk = d_date_sk
  AND d_year = ###_A and((ss_hdemo_sk=hd_demo_sk
                         AND cd_demo_sk = ss_cdemo_sk
                         AND cd_marital_status = &&&_A
                         AND cd_education_status = &&&_B
                         AND ss_sales_price BETWEEN ^^^_A AND ^^^_B
                         AND hd_dep_count = ###_B)
                        OR (ss_hdemo_sk=hd_demo_sk
                            AND cd_demo_sk = ss_cdemo_sk
                            AND cd_marital_status = &&&_C
                            AND cd_education_status = &&&_D
                            AND ss_sales_price BETWEEN ^^^_C AND ^^^_D
                            AND hd_dep_count = ###_C)
                        OR (ss_hdemo_sk=hd_demo_sk
                            AND cd_demo_sk = ss_cdemo_sk
                            AND cd_marital_status = &&&_E
                            AND cd_education_status = &&&_F
                            AND ss_sales_price BETWEEN ^^^_E AND ^^^_F
                            AND hd_dep_count = ###_D)) and((ss_addr_sk = ca_address_sk
                                                        AND ca_country = &&&_G
                                                        AND ca_state IN N_SSS_A
                                                        AND ss_net_profit BETWEEN ###_E AND ###_F)
                                                       OR (ss_addr_sk = ca_address_sk
                                                           AND ca_country = &&&_H
                                                           AND ca_state IN N_SSS_B
                                                           AND ss_net_profit BETWEEN ###_G AND ###_H)
                                                       OR (ss_addr_sk = ca_address_sk
                                                           AND ca_country = &&&_I
                                                           AND ca_state IN N_SSS_C
                                                           AND ss_net_profit BETWEEN ###_I AND ###_J)) ;