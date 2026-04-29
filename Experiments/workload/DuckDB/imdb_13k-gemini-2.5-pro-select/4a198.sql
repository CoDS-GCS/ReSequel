WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A4525',
                           'B5614',
                           'B6516',
                           'C451',
                           'D562',
                           'F6312',
                           'F6526',
                           'G6252',
                           'H6434',
                           'J253',
                           'J3153',
                           'J4653',
                           'K6413',
                           'L652',
                           'M2425',
                           'M6352',
                           'O3245',
                           'P3624',
                           'R25',
                           'S1325',
                           'S4356',
                           'S5212',
                           'W3525',
                           'W4523',
                           'X1654')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'composer',
                   'editor',
                   'producer',
                   'production designer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('26')
  AND (ci.note IN ('(archive footage)',
                   '(co-producer)',
                   '(consulting producer)',
                   '(creator)',
                   '(producer)',
                   '(screenplay)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: Japanese version)')
       OR ci.note IS NULL);