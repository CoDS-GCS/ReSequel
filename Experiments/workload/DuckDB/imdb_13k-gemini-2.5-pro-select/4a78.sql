WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A3412',
                           'A4514',
                           'B1523',
                           'B1561',
                           'D1356',
                           'F6525',
                           'G356',
                           'H634',
                           'J2625',
                           'K4235',
                           'L5325',
                           'M4615',
                           'M5153',
                           'P1413',
                           'P4321',
                           'S6352',
                           'T652',
                           'U3412'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'actress',
                   'producer',
                   'writer')
  AND it1.id IN ('32')
  AND (ci.note IN ('(as Girls Aloud)',
                   '(associate producer)',
                   '(co-producer)',
                   '(consulting producer)',
                   '(creator)',
                   '(producer)',
                   '(voice)')
       OR ci.note IS NULL);