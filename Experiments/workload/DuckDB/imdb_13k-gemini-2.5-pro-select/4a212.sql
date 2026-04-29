
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('25')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C2414',
                           'D1314',
                           'D1352',
                           'D3636',
                           'E6414',
                           'I1541',
                           'J2143',
                           'J2165',
                           'J2612',
                           'K3651',
                           'K5165',
                           'L524',
                           'L5353',
                           'R1436',
                           'T5213',
                           'T5265'))
  AND (ci.note IN ('(producer)',
                   '(production assistant)',
                   '(segment producer)',
                   '(story)')
       OR ci.note IS NULL);