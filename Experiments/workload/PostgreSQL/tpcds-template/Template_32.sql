SELECT *
FROM
  (SELECT avg(ss_list_price) B1_LP,
          count(ss_list_price) B1_CNT,
          count(DISTINCT ss_list_price) B1_CNTD
   FROM store_sales
   WHERE ss_quantity BETWEEN ### AND ###
     AND (ss_list_price BETWEEN ### AND ###
          OR ss_coupon_amt BETWEEN ### AND ###
          OR ss_wholesale_cost BETWEEN ### AND ###)) B1,

  (SELECT avg(ss_list_price) B2_LP,
          count(ss_list_price) B2_CNT,
          count(DISTINCT ss_list_price) B2_CNTD
   FROM store_sales
   WHERE ss_quantity BETWEEN ### AND ###
     AND (ss_list_price BETWEEN ### AND ###
          OR ss_coupon_amt BETWEEN ### AND ###
          OR ss_wholesale_cost BETWEEN ### AND ###)) B2,

  (SELECT avg(ss_list_price) B3_LP,
          count(ss_list_price) B3_CNT,
          count(DISTINCT ss_list_price) B3_CNTD
   FROM store_sales
   WHERE ss_quantity BETWEEN ### AND ###
     AND (ss_list_price BETWEEN ### AND ###
          OR ss_coupon_amt BETWEEN ### AND ###
          OR ss_wholesale_cost BETWEEN ### AND ###)) B3,

  (SELECT avg(ss_list_price) B4_LP,
          count(ss_list_price) B4_CNT,
          count(DISTINCT ss_list_price) B4_CNTD
   FROM store_sales
   WHERE ss_quantity BETWEEN ### AND ###
     AND (ss_list_price BETWEEN ### AND ###
          OR ss_coupon_amt BETWEEN ### AND ###
          OR ss_wholesale_cost BETWEEN ### AND ###)) B4,

  (SELECT avg(ss_list_price) B5_LP,
          count(ss_list_price) B5_CNT,
          count(DISTINCT ss_list_price) B5_CNTD
   FROM store_sales
   WHERE ss_quantity BETWEEN ### AND ###
     AND (ss_list_price BETWEEN ### AND ###
          OR ss_coupon_amt BETWEEN ### AND ###
          OR ss_wholesale_cost BETWEEN ### AND ###)) B5,

  (SELECT avg(ss_list_price) B6_LP,
          count(ss_list_price) B6_CNT,
          count(DISTINCT ss_list_price) B6_CNTD
   FROM store_sales
   WHERE ss_quantity BETWEEN ### AND ###
     AND (ss_list_price BETWEEN ### AND ###
          OR ss_coupon_amt BETWEEN ### AND ###
          OR ss_wholesale_cost BETWEEN ### AND ###)) B6
LIMIT ###;