
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B1252',
                           'B3635',
                           'C6234',
                           'D2313',
                           'J5253',
                           'R1632',
                           'V2425'))
  AND (ci.note IN ('(assistant location manager)',
                   '(producer)',
                   '(warm-up comic)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'miscellaneous crew',
                   'producer'))
  AND (it1.id IN ('19'));