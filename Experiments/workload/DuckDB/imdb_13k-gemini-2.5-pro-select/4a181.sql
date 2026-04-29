
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
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A525',
                           'C6424',
                           'D1345',
                           'D5465',
                           'G6326',
                           'I2521',
                           'J1323',
                           'J2524',
                           'J5251',
                           'K4246',
                           'L3216',
                           'L624',
                           'M3254',
                           'M6251',
                           'N2436',
                           'O4165',
                           'P426',
                           'S2326',
                           'S514',
                           'V2361',
                           'V4535',
                           'Y1252'))
  AND (ci.note IN ('(alderman)',
                   '(associate producer)',
                   '(director of photography) (as Jafet Tutanes)',
                   '(executive producer)',
                   '(field cashier)',
                   '(producer)',
                   '(unspecified crew member)',
                   '(voice)',
                   '(wrangler)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
  AND (it1.id IN ('26'));