
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
  AND (n.name_pcode_nf IN ('A4163',
                           'N4',
                           'P623',
                           'S3154',
                           'T2525'))
  AND (ci.note IN ('(executive producer: 4Kids Entertainment) (as Alfred R. Kahn)',
                   '(uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'director',
                   'producer'))
  AND (it1.id IN ('32'));