
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
  AND (n.name_pcode_nf IN ('A3621',
                           'A4541',
                           'B123',
                           'C6434',
                           'H5625',
                           'H6513',
                           'J26',
                           'J5252',
                           'J565',
                           'M2362',
                           'M3625',
                           'R5413',
                           'S256',
                           'S2563',
                           'S3152',
                           'S42',
                           'U2145',
                           'V1565',
                           'W312',
                           'W4363'))
  AND (ci.note IN ('(archive footage)',
                   '(assistant to producer)',
                   '(developer)',
                   '(executive producer)',
                   '(location manager)',
                   '(producer)',
                   '(production accountant) (uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
  AND (it1.id IN ('31'));