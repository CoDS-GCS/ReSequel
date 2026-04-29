
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B5254',
                           'B6362',
                           'C2616',
                           'C5463',
                           'D5414',
                           'E6561',
                           'H3453',
                           'K3656',
                           'M2326',
                           'M3164',
                           'R1616',
                           'R1636',
                           'S2621',
                           'S3542',
                           'S5216',
                           'S543',
                           'W',
                           'W4321',
                           'Y232'))
  AND (ci.note IN ('(associate producer)',
                   '(co-executive producer)',
                   '(credit only)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(re-edited international version)',
                   '(voice: Japanese version)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('34'));