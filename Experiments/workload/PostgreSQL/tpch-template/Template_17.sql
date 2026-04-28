SELECT p_brand,
       p_type,
       p_size,
       count(DISTINCT ps_suppkey) AS supplier_cnt
FROM partsupp,
     part
WHERE p_partkey = ps_partkey
  AND p_brand <> &&&
  AND p_type not like &&&
  AND p_size IN (N_III)
  AND ps_suppkey NOT IN
    (SELECT s_suppkey
     FROM supplier
     WHERE s_comment like &&&)
GROUP BY p_brand,
         p_type,
         p_size
ORDER BY supplier_cnt DESC,
         p_brand,
         p_type,
         p_size;