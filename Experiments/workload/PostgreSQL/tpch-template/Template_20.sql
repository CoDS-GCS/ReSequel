SELECT sum(l_extendedprice * l_discount) AS revenue
FROM lineitem
WHERE l_shipdate >= date &&&
  AND l_shipdate < date &&& + interval &&& YEAR
  AND l_discount BETWEEN ^^^ - ^^^ AND ^^^
  AND l_quantity < ###;