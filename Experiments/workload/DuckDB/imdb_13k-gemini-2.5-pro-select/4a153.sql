
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A1642',
                           'A5216',
                           'A525',
                           'G6532',
                           'J5313',
                           'K1524',
                           'K5164',
                           'L53',
                           'P3625',
                           'P4265',
                           'P4564',
                           'R525',
                           'S2313',
                           'T6263')
  AND (ci.note IN ('(associate head writer)',
                   '(executive producer)',
                   '(producer)',
                   '(producer: RTL)',
                   '(production accountant)',
                   '(production assistant)',
                   '(production intern)',
                   '(series producer)',
                   '(written by)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('22'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'));