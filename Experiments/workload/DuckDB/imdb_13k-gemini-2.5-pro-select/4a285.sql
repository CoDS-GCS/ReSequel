WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A2431',
                           'A5325',
                           'B4216',
                           'B6265',
                           'C4254',
                           'D1515',
                           'E1425',
                           'E1542',
                           'E1631',
                           'E3424',
                           'E4213',
                           'J3451',
                           'J4524',
                           'K2452',
                           'K2652',
                           'L2364',
                           'N1216',
                           'N5345',
                           'N6253',
                           'R1513',
                           'R5416',
                           'S2514',
                           'S2631')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('22')
  AND (ci.note IN ('(as Brooke Harmon)',
                   '(assistant: segment producers) (uncredited)',
                   '(production coordinator)',
                   '(production secretary)',
                   '(voice director)',
                   '(voice)')
       OR ci.note IS NULL);