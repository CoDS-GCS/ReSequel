
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
  AND (n.name_pcode_nf IN ('B6163',
                           'E4165',
                           'E6232',
                           'G4242',
                           'G6523',
                           'J5135',
                           'J516',
                           'K4153',
                           'M2563',
                           'P54',
                           'R145',
                           'S351',
                           'S3542',
                           'T3625',
                           'T625',
                           'W4251',
                           'Z2436'))
  AND (ci.note IN ('(assistant script coordinator) (as Penny Wylie)',
                   '(associate producer)',
                   '(deko operator)',
                   '(executive producer)',
                   '(producer)',
                   '(technical coordinator)',
                   '(uncredited)',
                   '(voice: Japanese version)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('26'));