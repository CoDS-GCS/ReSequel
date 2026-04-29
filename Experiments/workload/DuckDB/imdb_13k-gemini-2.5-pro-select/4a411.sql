WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A532',
                           'A5352',
                           'C6431',
                           'D1634',
                           'D5362',
                           'E3632',
                           'J2353',
                           'J25',
                           'J6263',
                           'M2421',
                           'N2424',
                           'R25',
                           'S3153'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress')
  AND it1.id IN ('34')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);