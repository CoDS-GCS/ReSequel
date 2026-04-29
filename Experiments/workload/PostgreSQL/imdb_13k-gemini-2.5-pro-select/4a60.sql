
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4163',
                           'B3126',
                           'B3245',
                           'B5264',
                           'D1354',
                           'E6212',
                           'J242',
                           'K5616',
                           'M2426',
                           'M6241',
                           'P1423',
                           'P3654',
                           'R2542',
                           'S1524',
                           'W4513',
                           'W4515')
  AND (ci.note IN ('(comic strip Mutt and Jeff)',
                   '(executive producer)',
                   '(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'producer',
                   'writer')
  AND it1.id IN ('37');