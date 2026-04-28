SELECT o_year,
       sum(CASE
               WHEN nation = &&& THEN volume
               ELSE ###
           END) / sum(volume) AS mkt_share
FROM
  (SELECT extract(YEAR
                  FROM o_orderdate) AS o_year,
          l_extendedprice * (### - l_discount) AS volume,
          n2.n_name AS nation
   FROM part,
        supplier,
        lineitem,
        orders,
        customer,
        nation n1,
        nation n2,
        region
   WHERE p_partkey = l_partkey
     AND s_suppkey = l_suppkey
     AND l_orderkey = o_orderkey
     AND o_custkey = c_custkey
     AND c_nationkey = n1.n_nationkey
     AND n1.n_regionkey = r_regionkey
     AND r_name = &&&
     AND s_nationkey = n2.n_nationkey
     AND o_orderdate BETWEEN date &&& AND date &&&
     AND p_type = &&&) AS all_nations
GROUP BY o_year
ORDER BY o_year;