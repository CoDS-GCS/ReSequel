WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A2436',
                           'B3534',
                           'B6563',
                           'C6231',
                           'D2125',
                           'D5435',
                           'H4124',
                           'L12',
                           'N5634',
                           'P5624',
                           'R3142',
                           'R3562',
                           'S316',
                           'T4516',
                           'V4236'))
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
                   'miscellaneous crew')
  AND it1.id IN ('32')
  AND (ci.note IN ('(news editor)',
                   '(voice: English version) (as Christopher R. Sabat)')
       OR ci.note IS NULL);