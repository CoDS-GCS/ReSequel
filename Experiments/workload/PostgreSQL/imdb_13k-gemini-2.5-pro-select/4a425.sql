
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('34')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4535',
                           'B5251',
                           'F632',
                           'G5435',
                           'G6216',
                           'G6234',
                           'J1435',
                           'J4236',
                           'J5245',
                           'J6564',
                           'K5364',
                           'M525',
                           'P24',
                           'P3523',
                           'P6235'))
  AND (ci.note IN ('(account executive) (uncredited)',
                   '(executive producer)',
                   '(uncredited)')
       OR ci.note IS NULL);