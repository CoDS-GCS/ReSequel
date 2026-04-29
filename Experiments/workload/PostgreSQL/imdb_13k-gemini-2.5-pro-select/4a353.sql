
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
  AND (n.name_pcode_nf IN ('B4153',
                           'B6161',
                           'D1313',
                           'D2426',
                           'D5626',
                           'E5253',
                           'J6241',
                           'L2314',
                           'M252',
                           'P3621',
                           'P4516',
                           'S6264',
                           'T6434',
                           'Y2525'))
  AND (ci.note IN ('(creator)',
                   '(in-house producer)',
                   '(voice: Japanese version)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'writer'))
  AND (it1.id IN ('34'));