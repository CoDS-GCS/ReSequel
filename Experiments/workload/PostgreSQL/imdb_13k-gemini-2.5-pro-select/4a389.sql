
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
  AND (n.name_pcode_nf IN ('A2356',
                           'A425',
                           'B6535',
                           'D134',
                           'G6243',
                           'J1616',
                           'J5236',
                           'J6253',
                           'M2426',
                           'R1634',
                           'R5436',
                           'S5256',
                           'T5236',
                           'T5245',
                           'T6162'))
  AND (ci.note IN ('(executive producer)',
                   '(overall in charge of promotion)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('32'));