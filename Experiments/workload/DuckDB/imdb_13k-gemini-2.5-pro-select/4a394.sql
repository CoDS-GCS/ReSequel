
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A6352',
                           'D132',
                           'D24',
                           'E3252',
                           'E4513',
                           'J5253',
                           'J5456',
                           'K4242',
                           'L2325',
                           'R2636',
                           'R5235',
                           'S1532',
                           'S2541',
                           'T5125',
                           'U4621'))
  AND (ci.note IN ('(characters)',
                   '(co-producer)',
                   '(consulting producer)',
                   '(field producer)',
                   '(producer)',
                   '(production assistant) (as Keila Marie Celso)',
                   '(production assistant)',
                   '(script continuity)',
                   '(script editor)',
                   '(storylines)',
                   '(supervising producer)',
                   '(technical director)')
       OR ci.note IS NULL);