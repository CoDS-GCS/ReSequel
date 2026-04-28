SELECT distinct(i_product_name)
FROM item i1
WHERE i_manufact_id BETWEEN ### AND ###
  AND
    (SELECT count(*) AS item_cnt
     FROM item
     WHERE (i_manufact = i1.i_manufact
            AND ((i_category = &&&
                  AND (i_color = &&&
                       OR i_color = &&&)
                  AND (i_units = &&&
                       OR i_units = &&&)
                  AND (i_size = &&&
                       OR i_size = &&&))
                 OR (i_category = &&&
                     AND (i_color = &&&
                          OR i_color = &&&)
                     AND (i_units = &&&
                          OR i_units = &&&)
                     AND (i_size = &&&
                          OR i_size = &&&))
                 OR (i_category = &&&
                     AND (i_color = &&&
                          OR i_color = &&&)
                     AND (i_units = &&&
                          OR i_units = &&&)
                     AND (i_size = &&&
                          OR i_size = &&&))
                 OR (i_category = &&&
                     AND (i_color = &&&
                          OR i_color = &&&)
                     AND (i_units = &&&
                          OR i_units = &&&)
                     AND (i_size = &&&
                          OR i_size = &&&))))
       OR (i_manufact = i1.i_manufact
           AND ((i_category = &&&
                 AND (i_color = &&&
                      OR i_color = &&&)
                 AND (i_units = &&&
                      OR i_units = &&&)
                 AND (i_size = &&&
                      OR i_size = &&&))
                OR (i_category = &&&
                    AND (i_color = &&&
                         OR i_color = &&&)
                    AND (i_units = &&&
                         OR i_units = &&&)
                    AND (i_size = &&&
                         OR i_size = &&&))
                OR (i_category = &&&
                    AND (i_color = &&&
                         OR i_color = &&&)
                    AND (i_units = &&&
                         OR i_units = &&&)
                    AND (i_size = &&&
                         OR i_size = &&&))
                OR (i_category = &&&
                    AND (i_color = &&&
                         OR i_color = &&&)
                    AND (i_units = &&&
                         OR i_units = &&&)
                    AND (i_size = &&&
                         OR i_size = &&&))))) > ###
ORDER BY i_product_name
LIMIT ###;