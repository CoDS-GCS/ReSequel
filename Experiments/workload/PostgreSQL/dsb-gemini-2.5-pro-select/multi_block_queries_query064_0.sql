 
  
  
 WITH cs_ui AS
  (SELECT cs_item_sk
   FROM catalog_sales,
        catalog_returns
   WHERE cs_item_sk = cr_item_sk
     AND cs_order_number = cr_order_number
     AND cs_wholesale_cost BETWEEN 80 AND 100
   GROUP BY cs_item_sk
   HAVING sum(cs_ext_list_price)>2*sum(cr_refunded_cash+cr_reversed_charge+cr_store_credit)),
     cross_sales_base AS
  (SELECT i_product_name,
          i_item_sk,
          s_store_name,
          s_zip,
          ad1.ca_street_number b_street_number,
          ad1.ca_street_name b_street_name,
          ad1.ca_city b_city,
          ad1.ca_zip b_zip,
          ad2.ca_street_number c_street_number,
          ad2.ca_street_name c_street_name,
          ad2.ca_city c_city,
          ad2.ca_zip c_zip,
          d1.d_year AS syear,
          d2.d_year AS fsyear,
          d3.d_year s2year,
          ss_wholesale_cost,
          ss_list_price,
          ss_coupon_amt
   FROM store_sales,
        store_returns,
        cs_ui,
        date_dim d1,
        date_dim d2,
        date_dim d3,
        store,
        customer,
        customer_demographics cd1,
        customer_demographics cd2,
        promotion,
        household_demographics hd1,
        household_demographics hd2,
        customer_address ad1,
        customer_address ad2,
        income_band ib1,
        income_band ib2,
        item
   WHERE ss_store_sk = s_store_sk
     AND ss_sold_date_sk = d1.d_date_sk
     AND ss_customer_sk = c_customer_sk
     AND ss_cdemo_sk= cd1.cd_demo_sk
     AND ss_hdemo_sk = hd1.hd_demo_sk
     AND ss_addr_sk = ad1.ca_address_sk
     AND ss_item_sk = i_item_sk
     AND ss_item_sk = sr_item_sk
     AND ss_ticket_number = sr_ticket_number
     AND ss_item_sk = cs_ui.cs_item_sk
     AND c_current_cdemo_sk = cd2.cd_demo_sk
     AND c_current_hdemo_sk = hd2.hd_demo_sk
     AND c_current_addr_sk = ad2.ca_address_sk
     AND c_first_sales_date_sk = d2.d_date_sk
     AND c_first_shipto_date_sk = d3.d_date_sk
     AND ss_promo_sk = p_promo_sk
     AND hd1.hd_income_band_sk = ib1.ib_income_band_sk
     AND hd2.hd_income_band_sk = ib2.ib_income_band_sk
     AND cd1.cd_marital_status <> cd2.cd_marital_status
     AND i_current_price BETWEEN 1 AND 1 + 10
     AND p_channel_email = 'Y'
     AND p_channel_tv = 'Y'
     AND p_channel_radio = 'Y'
     AND ad2.ca_state IN ('GA',
                          'IL',
                          'OH')
     AND ss_wholesale_cost BETWEEN 80 AND 100
     AND cd1.cd_marital_status IN ('W',
                                   'W',
                                   'D')
     AND cd1.cd_education_status IN ('College',
                                     '4 yr Degree',
                                     'College')
     AND cd2.cd_marital_status IN ('W',
                                   'W',
                                   'D')
     AND cd2.cd_education_status IN ('College',
                                     '4 yr Degree',
                                     'College')),
     year1_sales AS
  (SELECT *
   FROM cross_sales_base
   WHERE syear = 1999),
     year2_sales AS
  (SELECT *
   FROM cross_sales_base
   WHERE syear = 1999 + 1),
     agg1 AS
  (SELECT i_product_name,
          i_item_sk,
          s_store_name,
          s_zip,
          b_street_number,
          b_street_name,
          b_city,
          b_zip,
          c_street_number,
          c_street_name,
          c_city,
          c_zip,
          syear,
          fsyear,
          s2year,
          count(*) cnt,
          sum(ss_wholesale_cost) s1,
          sum(ss_list_price) s2,
          sum(ss_coupon_amt) s3
   FROM year1_sales
   GROUP BY i_product_name,
            i_item_sk,
            s_store_name,
            s_zip,
            b_street_number,
            b_street_name,
            b_city,
            b_zip,
            c_street_number,
            c_street_name,
            c_city,
            c_zip,
            syear,
            fsyear,
            s2year),
     agg2 AS
  (SELECT i_product_name,
          i_item_sk,
          s_store_name,
          s_zip,
          b_street_number,
          b_street_name,
          b_city,
          b_zip,
          c_street_number,
          c_street_name,
          c_city,
          c_zip,
          syear,
          fsyear,
          s2year,
          count(*) cnt,
          sum(ss_wholesale_cost) s1,
          sum(ss_list_price) s2,
          sum(ss_coupon_amt) s3
   FROM year2_sales
   GROUP BY i_product_name,
            i_item_sk,
            s_store_name,
            s_zip,
            b_street_number,
            b_street_name,
            b_city,
            b_zip,
            c_street_number,
            c_street_name,
            c_city,
            c_zip,
            syear,
            fsyear,
            s2year)
SELECT cs1.i_product_name,
       cs1.s_store_name,
       cs1.s_zip,
       cs1.b_street_number,
       cs1.b_street_name,
       cs1.b_city,
       cs1.b_zip,
       cs1.c_street_number,
       cs1.c_street_name,
       cs1.c_city,
       cs1.c_zip,
       cs1.syear,
       cs1.cnt,
       cs1.s1 AS s11,
       cs1.s2 AS s21,
       cs1.s3 AS s31,
       cs2.s1 AS s12,
       cs2.s2 AS s22,
       cs2.s3 AS s32,
       cs2.syear,
       cs2.cnt
FROM agg1 cs1
JOIN agg2 cs2 ON cs1.i_item_sk = cs2.i_item_sk
AND cs1.s_store_name = cs2.s_store_name
AND cs1.s_zip = cs2.s_zip
WHERE cs2.cnt <= cs1.cnt
ORDER BY cs1.i_product_name,
         cs1.s_store_name,
         cs2.cnt,
         cs1.s1,
         cs2.s1;