WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('B5252',
                           'B6234',
                           'D2152',
                           'F6234',
                           'J2451',
                           'L6241',
                           'M3532',
                           'M421',
                           'M6525',
                           'M6562',
                           'N6516',
                           'O4252',
                           'R1453',
                           'R5415',
                           'S2125',
                           'S2624',
                           'V3656',
                           'W6564',
                           'Z25'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('25')
  AND (ci.note IN ('(actors director)',
                   '(developed for television by)',
                   '(executive producer)')
       OR ci.note IS NULL);