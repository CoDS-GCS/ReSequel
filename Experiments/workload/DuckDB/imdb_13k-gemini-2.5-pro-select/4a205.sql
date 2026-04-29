
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'miscellaneous crew')
  AND it1.id IN ('34')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('G6212',
                           'J514',
                           'J5231',
                           'K1513',
                           'K4263',
                           'L623',
                           'N4132')
  AND (ci.note IN ('(archive footage)',
                   '(audience coordinator)',
                   '(voice)')
       OR ci.note IS NULL);