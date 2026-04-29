
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4262',
                           'C6245',
                           'C6425',
                           'G4163',
                           'J2156',
                           'L2163',
                           'M2525',
                           'M6216',
                           'M6242',
                           'P32',
                           'R2632',
                           'T525'))
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'producer')
  AND it1.id IN ('32');