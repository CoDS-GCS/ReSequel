
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'director',
                   'editor',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6532',
                           'G4625',
                           'J254',
                           'M4545',
                           'S3256',
                           'S4252'))
  AND (ci.note IN ('(associate producer)',
                   '(voice)')
       OR ci.note IS NULL);