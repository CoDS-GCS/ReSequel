
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C4213',
                           'C6231',
                           'D6362',
                           'E4534',
                           'G3524',
                           'I4352',
                           'J4346',
                           'J5161',
                           'J5412',
                           'K52',
                           'L2634',
                           'L2653',
                           'L6212',
                           'M6212',
                           'R1521',
                           'R2632',
                           'S325',
                           'S4256',
                           'W5341'))
  AND (ci.note IN ('(marketing and public relations)',
                   '(producer)',
                   '(production coordinator)',
                   '(story consultant) (as Sally Sussman)',
                   '(supervising director)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('34'));