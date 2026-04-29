
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2162',
                           'B1646',
                           'E5165',
                           'I4515',
                           'L5354',
                           'M6452',
                           'S2165',
                           'S5365',
                           'V2523'))
  AND (ci.note IN ('(script supervisor)',
                   '(supervising producer)',
                   '(teleprompter operator)')
       OR ci.note IS NULL);