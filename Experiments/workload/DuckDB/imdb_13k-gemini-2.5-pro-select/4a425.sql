
SELECT COUNT(*)
FROM name AS n,
     aka_name AS an,
     info_type AS it1,
     person_info AS pi1,
     cast_info AS ci,
     role_type AS rt
WHERE n.id = an.person_id
  AND n.id = pi1.person_id
  AND n.id = ci.person_id
  AND pi1.info_type_id = it1.id
  AND ci.role_id = rt.id
  AND (n.gender IN ('f',
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
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'production designer'))
  AND (it1.id IN ('34'));