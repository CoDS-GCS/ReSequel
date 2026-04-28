WITH customer_total_return AS
  (SELECT sr_customer_sk AS ctr_customer_sk,
          sr_store_sk AS ctr_store_sk,
          sr_reason_sk AS ctr_reason_sk,
          sum(SR_REFUNDED_CASH) AS ctr_total_return
   FROM store_returns,
        date_dim
   WHERE sr_returned_date_sk = d_date_sk
     AND d_year =###_A
     AND sr_return_amt / sr_return_quantity BETWEEN ###_B AND ###_C
   GROUP BY sr_customer_sk,
            sr_store_sk,
            sr_reason_sk)
SELECT c_customer_id
FROM customer_total_return ctr1,
     store,
     customer,
     customer_demographics
WHERE ctr1.ctr_total_return >
    (SELECT avg(ctr_total_return)*^^^_A
     FROM customer_total_return ctr2
     WHERE ctr1.ctr_store_sk = ctr2.ctr_store_sk)
  AND ctr1.ctr_reason_sk BETWEEN ###_D AND ###_E
  AND s_store_sk = ctr1.ctr_store_sk
  AND s_state IN N_SSS_A
  AND ctr1.ctr_customer_sk = c_customer_sk
  AND c_current_cdemo_sk = cd_demo_sk
  AND cd_marital_status IN N_SSS_B
  AND cd_education_status IN N_SSS_C
  AND cd_gender = &&&_A
  AND c_birth_month = ###_F
  AND c_birth_year BETWEEN ###_G AND ###_H
ORDER BY c_customer_id
LIMIT ###_I;