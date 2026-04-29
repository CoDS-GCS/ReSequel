
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'director',
                   'editor',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B1525',
                           'C6215',
                           'E4532',
                           'J2521',
                           'N2414'))
  AND (ci.note IN ('(as Joachim)',
                   '(associate producer)',
                   '(executive producer)')
       OR ci.note IS NULL);