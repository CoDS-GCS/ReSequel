
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('B6353',
                           'C6514',
                           'L6436',
                           'N2421',
                           'P2621',
                           'P6252',
                           'P6362',
                           'T1615')
  AND (ci.note IN ('(as Miki Manojlovic)',
                   '(location manager)',
                   '(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('31');