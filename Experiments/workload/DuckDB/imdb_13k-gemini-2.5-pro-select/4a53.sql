
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
  AND (n.name_pcode_nf IN ('A6416',
                           'B6521',
                           'C4316',
                           'C5325',
                           'D2456',
                           'E2325',
                           'G1523',
                           'H5623',
                           'I5353',
                           'J1615',
                           'J2632',
                           'J514',
                           'J53',
                           'L2626',
                           'M3152',
                           'M6516',
                           'N3153',
                           'N3413',
                           'N3423',
                           'R242',
                           'R256',
                           'S3141',
                           'S5361',
                           'T6235',
                           'W6531'))
  AND (ci.note IN ('(as John Foley)',
                   '(co-executive producer)',
                   '(co-producer)',
                   '(creator)',
                   '(executive producer)',
                   '(master editor)',
                   '(producer)',
                   '(production secretary)',
                   '(script supervisor)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
  AND (it1.id IN ('32'));