SELECT count(*)
FROM (
        (SELECT DISTINCT c_last_name,
                         c_first_name,
                         d_date
         FROM store_sales,
              date_dim,
              customer
         WHERE store_sales.ss_sold_date_sk = date_dim.d_date_sk
           AND store_sales.ss_customer_sk = customer.c_customer_sk
           AND d_month_seq BETWEEN ###_A AND ###_B+###_C
           AND ss_list_price BETWEEN ###_D AND ###_E
           AND c_birth_year BETWEEN ###_F AND ###_G
           AND ss_wholesale_cost BETWEEN ###_H AND ###_I)
      EXCEPT
        (SELECT DISTINCT c_last_name,
                         c_first_name,
                         d_date
         FROM catalog_sales,
              date_dim,
              customer
         WHERE catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
           AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk
           AND d_month_seq BETWEEN ###_J AND ###_K+###_L
           AND cs_list_price BETWEEN ###_M AND ###_N
           AND c_birth_year BETWEEN ###_O AND ###_P
           AND cs_wholesale_cost BETWEEN ###_Q AND ###_R)
      EXCEPT
        (SELECT DISTINCT c_last_name,
                         c_first_name,
                         d_date
         FROM web_sales,
              date_dim,
              customer
         WHERE web_sales.ws_sold_date_sk = date_dim.d_date_sk
           AND web_sales.ws_bill_customer_sk = customer.c_customer_sk
           AND d_month_seq BETWEEN ###_S AND ###_T+###_U
           AND ws_list_price BETWEEN ###_V AND ###_W
           AND c_birth_year BETWEEN ###_X AND ###_Y
           AND ws_wholesale_cost BETWEEN ###_Z AND ###_AA)) cool_cust ;