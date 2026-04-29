
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
  AND (n.name_pcode_nf IN ('B3626',
                           'C4532',
                           'C4652',
                           'C5325',
                           'D5215',
                           'D5361',
                           'J5453',
                           'M265',
                           'M6263',
                           'N2425',
                           'P4525',
                           'T5234',
                           'T5252'))
  AND (ci.note IN ('(executive producer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'actress',
                   'director',
                   'producer'))
  AND (it1.id IN ('31'));