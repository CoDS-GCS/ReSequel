
SELECT COUNT(*)
FROM name AS n
INNER JOIN aka_name AS an ON n.id = an.person_id
INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
INNER JOIN cast_info AS ci ON n.id = ci.person_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5625',
                           'B6162',
                           'C6215',
                           'C6231',
                           'D5256',
                           'J2124',
                           'J2353',
                           'J5216',
                           'K3652',
                           'P425',
                           'S5326')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(archive footage)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'director')
  AND it1.id IN ('37');