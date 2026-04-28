WITH customer_total_return AS
  (SELECT wr_returning_customer_sk AS ctr_customer_sk,
          ca_state AS ctr_state,
          wr_reason_sk AS ctr_reason_sk,
          sum(wr_return_amt) AS ctr_total_return
   FROM web_returns,
        date_dim,
        customer_address,
        item
   WHERE wr_returned_date_sk = d_date_sk
     AND d_year =###_A
     AND wr_returning_addr_sk = ca_address_sk
     AND wr_item_sk = i_item_sk
     AND i_manager_id BETWEEN ###_B AND ###_C
     AND wr_return_amt / wr_return_quantity BETWEEN ###_D AND ###_E
   GROUP BY wr_returning_customer_sk,
            ca_state,
            wr_reason_sk)
SELECT c_customer_id,
       c_salutation,
       c_first_name,
       c_last_name,
       c_preferred_cust_flag,
       c_birth_day,
       c_birth_month,
       c_birth_year,
       c_birth_country,
       c_login,
       c_email_address,
       c_last_review_date_sk,
       ctr_total_return
FROM customer_total_return ctr1,
     customer_address,
     customer
WHERE ctr1.ctr_total_return >
    (SELECT avg(ctr_total_return)*^^^_A
     FROM customer_total_return ctr2
     WHERE ctr1.ctr_state = ctr2.ctr_state)
  AND ca_address_sk = c_current_addr_sk
  AND ca_state IN N_SSS_A
  AND ctr1.ctr_customer_sk = c_customer_sk
  AND ctr1.ctr_reason_sk IN N_III_A
  AND c_birth_year BETWEEN ###_F AND ###_G
ORDER BY c_customer_id,
         c_salutation,
         c_first_name,
         c_last_name,
         c_preferred_cust_flag,
         c_birth_day,
         c_birth_month,
         c_birth_year,
         c_birth_country,
         c_login,
         c_email_address,
         c_last_review_date_sk,
         ctr_total_return
LIMIT ###_H;