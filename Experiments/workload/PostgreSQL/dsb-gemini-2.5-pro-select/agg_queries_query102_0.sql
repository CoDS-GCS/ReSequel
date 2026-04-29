 
  
  
 WITH matching_sales AS
  (SELECT c.c_current_cdemo_sk,
          c.c_current_hdemo_sk
   FROM store_sales ss
   JOIN date_dim d1 ON ss.ss_sold_date_sk = d1.d_date_sk
   AND d1.d_year = 2001
   JOIN item i ON ss.ss_item_sk = i.i_item_sk
   AND i.i_category IN ('Books',
                     'Home',
                     'Sports')
   AND i.i_manager_id IN (3,
                       15,
                       17,
                       26,
                       43,
                       44,
                       55,
                       70,
                       82,
                       95)
   JOIN inventory inv ON ss.ss_item_sk = inv.inv_item_sk
   AND ss.ss_sold_date_sk = inv.inv_date_sk
   AND inv.inv_quantity_on_hand >= ss.ss_quantity
   JOIN customer c ON ss.ss_customer_sk = c.c_customer_sk
   JOIN customer_address ca ON c.c_current_addr_sk = ca.ca_address_sk
   AND ca.ca_state IN ('IN',
                   'LA',
                   'NE',
                   'NM',
                   'OH')
   JOIN web_sales ws ON ss.ss_item_sk = ws.ws_item_sk
   AND ss.ss_customer_sk = ws.ws_bill_customer_sk
   AND ws.ws_wholesale_cost BETWEEN 80 AND 100
   JOIN date_dim d2 ON ws.ws_sold_date_sk = d2.d_date_sk
   AND d2.d_date BETWEEN d1.d_date AND (d1.d_date + interval '30 day')
   JOIN warehouse w ON ws.ws_warehouse_sk = w.w_warehouse_sk
   JOIN store s ON s.s_state = w.w_state)
SELECT cd.cd_gender,
       cd.cd_marital_status,
       cd.cd_education_status,
       hd.hd_vehicle_count,
       count(*) AS cnt
FROM matching_sales ms
JOIN customer_demographics cd ON ms.c_current_cdemo_sk = cd.cd_demo_sk
JOIN household_demographics hd ON ms.c_current_hdemo_sk = hd.hd_demo_sk
GROUP BY cd.cd_gender,
         cd.cd_marital_status,
         cd.cd_education_status,
         hd.hd_vehicle_count
ORDER BY cnt;