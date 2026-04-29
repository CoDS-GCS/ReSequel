
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A23',
                           'B4236',
                           'B4246',
                           'D2525',
                           'E4525',
                           'E6515',
                           'F4216',
                           'G342',
                           'H3246',
                           'J3615',
                           'J513',
                           'L2165',
                           'L3264',
                           'L5256',
                           'O3165',
                           'S3',
                           'S6454',
                           'W54')
  AND (ci.note IN ('(idea) (uncredited)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'director',
                   'writer')
  AND it1.id IN ('25');