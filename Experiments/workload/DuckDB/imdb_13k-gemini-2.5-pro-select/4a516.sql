
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('22')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B1324',
                           'B6162',
                           'B6342',
                           'D1321',
                           'F6323',
                           'G6561',
                           'H5265',
                           'J2541',
                           'K1565',
                           'N214',
                           'R1214',
                           'R5452',
                           'S2536',
                           'W465'))
  AND (ci.note IN ('(script supervisor)',
                   '(series story editor)',
                   '(uncredited)',
                   '(video)',
                   '(writer) (as Onay Sales)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'writer');