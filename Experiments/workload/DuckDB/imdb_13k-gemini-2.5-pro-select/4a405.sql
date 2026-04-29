
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actor',
                   'director')
  AND it1.id IN ('37')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('B6512',
                           'F6524',
                           'G6241',
                           'H2362',
                           'J2326',
                           'L25',
                           'M5426',
                           'M6245',
                           'P365',
                           'P45')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);