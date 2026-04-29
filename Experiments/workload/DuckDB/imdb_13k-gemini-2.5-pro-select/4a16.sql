WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A2434',
                           'A3564',
                           'A5145',
                           'B51',
                           'D1314',
                           'D241',
                           'F6323',
                           'F6526',
                           'G526',
                           'J2414',
                           'J5254',
                           'J6516',
                           'K232',
                           'K6545',
                           'M3654',
                           'N2145',
                           'N2452',
                           'N5321',
                           'P4165',
                           'R2636',
                           'R513',
                           'T1632',
                           'T5326',
                           'Y526'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('19')
  AND (ci.note IN ('(as Hiroshi Kawai)',
                   '(associate producer)',
                   '(choreographer)',
                   '(creator)',
                   '(location manager)',
                   '(producer)',
                   '(supervising producer)',
                   '(uncredited)',
                   '(writer)',
                   '(written by)')
       OR ci.note IS NULL);