
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'director',
                   'editor')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B4262',
                           'D4616',
                           'H2653',
                           'H5236',
                           'H6562',
                           'J6316',
                           'M262'))
  AND (ci.note IN ('(as BJ Karganilla)',
                   '(voice)')
       OR ci.note IS NULL);