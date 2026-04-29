WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A1265',
                           'A25',
                           'A5256',
                           'E6251',
                           'G1642',
                           'H1216',
                           'H2425',
                           'H4254',
                           'J42',
                           'K43',
                           'K5135',
                           'L2165',
                           'M2465',
                           'M2523',
                           'M5245',
                           'M6263',
                           'M652',
                           'R14',
                           'S25',
                           'S3152',
                           'S5456',
                           'S6565',
                           'T4635',
                           'V6162'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('37')
  AND (ci.note IN ('(as Keiko Hayase)',
                   '(as Margarida Vilanova)',
                   '(as Michelle Renaud)',
                   '(floor manager)',
                   '(head writer)',
                   '(production intern)',
                   '(uncredited)',
                   '(voice)',
                   '(voice: Japanese version)',
                   '(writer)')
       OR ci.note IS NULL);