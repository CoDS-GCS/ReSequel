SELECT avg(ss_quantity),
       avg(ss_ext_sales_price),
       avg(ss_ext_wholesale_cost),
       sum(ss_ext_wholesale_cost)
FROM store_sales,
     store,
     customer_demographics,
     household_demographics,
     customer_address,
     date_dim
WHERE s_store_sk = ss_store_sk
  AND ss_sold_date_sk = d_date_sk
  AND d_year = ### and((ss_hdemo_sk=hd_demo_sk
                         AND cd_demo_sk = ss_cdemo_sk
                         AND cd_marital_status = &&&
                         AND cd_education_status = &&&
                         AND ss_sales_price BETWEEN ^^^ AND ^^^
                         AND hd_dep_count = ###)
                        OR (ss_hdemo_sk=hd_demo_sk
                            AND cd_demo_sk = ss_cdemo_sk
                            AND cd_marital_status = &&&
                            AND cd_education_status = &&&
                            AND ss_sales_price BETWEEN ^^^ AND ^^^
                            AND hd_dep_count = ###)
                        OR (ss_hdemo_sk=hd_demo_sk
                            AND cd_demo_sk = ss_cdemo_sk
                            AND cd_marital_status = &&&
                            AND cd_education_status = &&&
                            AND ss_sales_price BETWEEN ^^^ AND ^^^
                            AND hd_dep_count = ###)) and((ss_addr_sk = ca_address_sk
                                                        AND ca_country = &&&
                                                        AND ca_state IN (N_SSS)
                                                        AND ss_net_profit BETWEEN ### AND ###)
                                                       OR (ss_addr_sk = ca_address_sk
                                                           AND ca_country = &&&
                                                           AND ca_state IN (N_SSS)
                                                           AND ss_net_profit BETWEEN ### AND ###)
                                                       OR (ss_addr_sk = ca_address_sk
                                                           AND ca_country = &&&
                                                           AND ca_state IN (N_SSS)
                                                           AND ss_net_profit BETWEEN ### AND ###)) ;