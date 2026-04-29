
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('37')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('B3126',
                           'C5325',
                           'C6252',
                           'C6452',
                           'C6543',
                           'D5453',
                           'G1515',
                           'G1525',
                           'G4546',
                           'G6261',
                           'H5636',
                           'J2632',
                           'J5152',
                           'M5252',
                           'N3125',
                           'R1634',
                           'R546',
                           'S3121',
                           'S4365',
                           'T3216',
                           'T5412',
                           'V4324'))
  AND (ci.note IN ('(as Slater)',
                   '(creator)',
                   '(executive producer)',
                   '(medical technical advisor) (uncredited)',
                   '(producer)',
                   '(production assistant)',
                   '(uncredited)')
       OR ci.note IS NULL);