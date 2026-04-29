
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('32')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3562',
                           'A45',
                           'B3245',
                           'D365',
                           'J512',
                           'L2326',
                           'M3146',
                           'M6252',
                           'R5235',
                           'V4614',
                           'Y2565'))
  AND (ci.note IN ('(assistant location manager)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'costume designer',
                   'director',
                   'miscellaneous crew');