
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
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2162',
                           'B1646',
                           'E5165',
                           'I4515',
                           'L5354',
                           'M6452',
                           'S2165',
                           'S5365',
                           'V2523'))
  AND (ci.note IN ('(script supervisor)',
                   '(supervising producer)',
                   '(teleprompter operator)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer'))
  AND (it1.id IN ('22'));