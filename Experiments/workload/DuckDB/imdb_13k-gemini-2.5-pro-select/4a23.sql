WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('B6531',
                           'C4532',
                           'D5361',
                           'E2315',
                           'G162',
                           'H626',
                           'J2346',
                           'J5236',
                           'J5453',
                           'L52',
                           'M5426',
                           'R5341',
                           'S53')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('34')
  AND (ci.note IN ('(voice)',
                   '(writer)')
       OR ci.note IS NULL);