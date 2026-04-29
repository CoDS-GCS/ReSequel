
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('A45',
                           'B1264',
                           'B6514',
                           'D2142',
                           'D2531',
                           'E6245',
                           'F216',
                           'J2342',
                           'M6236',
                           'R5352',
                           'T6535',
                           'V2365')
  AND (ci.note IN ('(uncredited)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'writer')
  AND it1.id IN ('34');