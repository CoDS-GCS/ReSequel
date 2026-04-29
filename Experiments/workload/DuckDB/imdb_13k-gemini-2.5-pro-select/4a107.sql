
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('D5136',
                           'D5235',
                           'D5362',
                           'G6214',
                           'H43',
                           'M2562',
                           'S3152',
                           'S525'))
  AND (ci.note IN ('(co-producer)',
                   '(executive producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'director',
                   'editor',
                   'producer')
  AND it1.id IN ('31');