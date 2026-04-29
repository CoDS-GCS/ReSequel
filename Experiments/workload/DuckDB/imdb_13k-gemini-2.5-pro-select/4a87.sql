
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('37')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3252',
                           'C3652',
                           'C6425',
                           'E2312',
                           'F4251',
                           'G6316',
                           'I2623',
                           'J2142',
                           'L6162',
                           'M2414',
                           'M3252',
                           'M6252',
                           'P1252',
                           'P4526',
                           'P6152',
                           'R1236',
                           'R3621',
                           'S2625',
                           'S3541',
                           'S6142',
                           'T2616',
                           'T6263',
                           'V2532',
                           'X56'))
  AND (ci.note IN ('(armorer) (uncredited)',
                   '(assistant location manager) (as Feliciano Frias Jr.)',
                   '(assistant producer)',
                   '(associate producer)',
                   '(co-executive producer)',
                   '(executive producer)',
                   '(location manager)',
                   '(opening montage)',
                   '(producer)',
                   '(story coordinator)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer');