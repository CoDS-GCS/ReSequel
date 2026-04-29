WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A5343',
                           'B6162',
                           'C6456',
                           'D5265',
                           'E426',
                           'F6525',
                           'H3162',
                           'J356',
                           'J3652',
                           'J463',
                           'J5232',
                           'J5346',
                           'J6351',
                           'K6252',
                           'L5632',
                           'M2123',
                           'M6361',
                           'P5463',
                           'R342',
                           'S1216',
                           'S146',
                           'S616',
                           'T3524')),
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
WHERE it1.id IN ('25')
  AND (ci.note IN ('(child acting coach)',
                   '(unit publicist) (uncredited)',
                   '(voice)')
       OR ci.note IS NULL);