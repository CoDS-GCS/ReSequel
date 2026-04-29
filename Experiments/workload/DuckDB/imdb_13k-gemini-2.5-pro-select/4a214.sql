
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(as Lecy Goranson)',
                   '(assistant script editor)',
                   '(associate producer)',
                   '(co-producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(series producer)',
                   '(supervising director)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4265',
                           'A4516',
                           'A6362',
                           'A6523',
                           'B41',
                           'B6213',
                           'B6252',
                           'I2521',
                           'J243',
                           'J265',
                           'J4262',
                           'J5165',
                           'J5243',
                           'K3656',
                           'K4153',
                           'L215',
                           'M6532',
                           'N2423',
                           'N623',
                           'P3621',
                           'V5326'))
  AND it1.id IN ('37');