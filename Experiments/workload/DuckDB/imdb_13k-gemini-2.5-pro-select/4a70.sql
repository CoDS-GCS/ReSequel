
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2363',
                           'B6563',
                           'G6142',
                           'G6352',
                           'H2416',
                           'L1625',
                           'M231',
                           'M2452',
                           'M2564',
                           'M6513',
                           'R5612',
                           'S4216',
                           'S4615'))
  AND (ci.note IN ('(associate producer) (as Hazel Bolisay Parfan)',
                   '(associate producer)',
                   '(creative supervision)',
                   '(creator)',
                   '(executive producer)',
                   '(master editor)')
       OR ci.note IS NULL);