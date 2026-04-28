SELECT count(*)
FROM
  (SELECT DISTINCT c_last_name,
                   c_first_name,
                   d_date
   FROM store_sales,
        date_dim,
        customer
   WHERE store_sales.ss_sold_date_sk = date_dim.d_date_sk
     AND store_sales.ss_customer_sk = customer.c_customer_sk
     AND d_month_seq BETWEEN ###_A AND ###_B + ###_C
     AND c_birth_month IN N_III_A
     AND ss_list_price BETWEEN ###_D AND ###_E
     AND ss_wholesale_cost BETWEEN ###_F AND ###_G INTERSECT SELECT DISTINCT c_last_name,
                                                                        c_first_name,
                                                                        d_date
   FROM catalog_sales,
        date_dim,
        customer
   WHERE catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
     AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk
     AND d_month_seq BETWEEN ###_H AND ###_I + ###_J
     AND c_birth_month IN N_III_B
     AND cs_list_price BETWEEN ###_K AND ###_L
     AND cs_wholesale_cost BETWEEN ###_M AND ###_N INTERSECT SELECT DISTINCT c_last_name,
                                                                        c_first_name,
                                                                        d_date
   FROM web_sales,
        date_dim,
        customer
   WHERE web_sales.ws_sold_date_sk = date_dim.d_date_sk
     AND web_sales.ws_bill_customer_sk = customer.c_customer_sk
     AND d_month_seq BETWEEN ###_O AND ###_P + ###_Q
     AND c_birth_month IN N_III_C
     AND ws_list_price BETWEEN ###_R AND ###_S
     AND ws_wholesale_cost BETWEEN ###_T AND ###_U) hot_cust
LIMIT ###_V;