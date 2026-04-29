
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
  AND (n.name_pcode_nf IN ('A2356',
                           'A4546',
                           'A5352',
                           'D1326',
                           'H5265',
                           'M3152',
                           'M325',
                           'R1315'))
  AND (ci.note IN ('(consulting producer)',
                   '(director of production technology)',
                   '(producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer');