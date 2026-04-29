WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A2545',
                           'A3615',
                           'A5215',
                           'A5245',
                           'C6424',
                           'D6243',
                           'E1514',
                           'F5345',
                           'H6525',
                           'I4512',
                           'J5232',
                           'M23',
                           'M5625',
                           'M6425',
                           'P2346',
                           'R3126',
                           'S2516',
                           'S5343',
                           'V2361',
                           'Z2134',
                           'Z6562'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('22')
  AND (ci.note IN ('(archive footage)',
                   '(as Zsazsa Padilla)',
                   '(consulting producer)',
                   '(head writer)',
                   '(production secretary)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: English version)',
                   '(writer)')
       OR ci.note IS NULL);