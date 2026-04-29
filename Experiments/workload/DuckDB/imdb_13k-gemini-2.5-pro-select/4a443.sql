
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B6215',
                           'G4653',
                           'G5416',
                           'H4524',
                           'I5136',
                           'J5124',
                           'L1625',
                           'M2361',
                           'T5213'))
  AND (ci.note IN ('(producer)',
                   '(voice: English version)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'costume designer',
                   'director',
                   'editor',
                   'producer',
                   'writer'))
  AND (it1.id IN ('26'));