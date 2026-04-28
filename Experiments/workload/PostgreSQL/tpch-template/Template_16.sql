SELECT o_orderpriority,
       count(*) AS order_count
FROM orders
WHERE o_orderdate >= date &&&
  AND o_orderdate < date &&& + interval &&& MONTH
  AND EXISTS
    (SELECT *
     FROM lineitem
     WHERE l_orderkey = o_orderkey
       AND l_commitdate < l_receiptdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;