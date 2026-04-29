WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4163',
                           'A4562',
                           'D5426',
                           'H2126',
                           'J5325',
                           'J5352',
                           'J5424',
                           'K6123',
                           'L1612',
                           'M3265',
                           'N3514',
                           'P1623',
                           'P63'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('31')
  AND (ci.note IN ('(as Mitchell Ryan)',
                   '(food stylist)',
                   '(writer)')
       OR ci.note IS NULL);