
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
  AND (n.name_pcode_nf IN ('A453',
                           'A5246',
                           'B4365',
                           'C6261',
                           'D25',
                           'E4213',
                           'F4254',
                           'F6353',
                           'G6251',
                           'G6312',
                           'I3435',
                           'K4236',
                           'K5256',
                           'K6325',
                           'M6525',
                           'M6532',
                           'P2312',
                           'S6165',
                           'T621',
                           'X2365'))
  AND (ci.note IN ('(co-executive producer)',
                   '(consulting producer)',
                   '(executive producer)',
                   '(horse wrangler)',
                   '(producer)',
                   '(technical advisor)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('26'));