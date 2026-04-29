
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B2652',
                           'E3246',
                           'E3263',
                           'G6316',
                           'H2453',
                           'H4561',
                           'H5321',
                           'J1362',
                           'J362',
                           'J5362',
                           'K5146',
                           'N2162',
                           'O4165',
                           'P4216',
                           'R2656',
                           'R3213',
                           'S3156',
                           'T5125',
                           'U4136',
                           'W1236',
                           'Y252',
                           'Y5216'))
  AND (ci.note IN ('(as Land Vieira)',
                   '(director of photography)',
                   '(executive producer)',
                   '(location manager) (as Egay del Rosario)',
                   '(producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('34'));