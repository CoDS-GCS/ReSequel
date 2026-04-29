
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('m')
  AND n.name_pcode_nf IN ('H6126',
                           'H6163',
                           'K2452',
                           'L6236',
                           'L6531',
                           'M5242',
                           'M6234',
                           'M6242',
                           'O2512',
                           'R2424',
                           'S5256',
                           'T5231',
                           'V5253')
  AND (ci.note IN ('(as Herb Sargent)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'director',
                   'writer')
  AND it1.id IN ('37');