SELECT sum(l_extendedprice* (1 - l_discount)) AS revenue
FROM lineitem,
     part
WHERE (p_partkey = l_partkey
       AND p_brand = &&&
       AND p_container IN (N_SSS)
       AND l_quantity >= ###
       AND l_quantity <= ###
       AND p_size BETWEEN ### AND ###
       AND l_shipmode IN (N_SSS)
       AND l_shipinstruct = &&&)
  OR (p_partkey = l_partkey
      AND p_brand = &&&
      AND p_container IN (N_SSS)
      AND l_quantity >= ###
      AND l_quantity <= ###
      AND p_size BETWEEN ### AND ###
      AND l_shipmode IN (N_SSS)
      AND l_shipinstruct = &&&)
  OR (p_partkey = l_partkey
      AND p_brand = &&&
      AND p_container IN (N_SSS)
      AND l_quantity >= ###
      AND l_quantity <= ###
      AND p_size BETWEEN ### AND ###
      AND l_shipmode IN (N_SSS)
      AND l_shipinstruct = &&&);