WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A3451',
                           'E1463',
                           'E4325',
                           'E6213',
                           'F6312',
                           'J2163',
                           'J5165',
                           'K324',
                           'L4256',
                           'M5323',
                           'M6364',
                           'M6426',
                           'M6454',
                           'N163',
                           'P3621',
                           'S5415',
                           'X52'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'producer')
  AND it1.id IN ('37')
  AND (ci.note IN ('(as Dr. Joyce Brothers)',
                   '(as Mariel)',
                   '(associate producer)',
                   '(producer)',
                   '(voice)')
       OR ci.note IS NULL);