
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON ci.person_id = pi1.person_id
AND n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
AND ci.person_id = an.person_id
AND an.person_id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4251',
                           'A5353',
                           'B6353',
                           'C6212',
                           'C6245',
                           'C6453',
                           'E5425',
                           'F6523',
                           'G6216',
                           'J2352',
                           'J262',
                           'K6452',
                           'M6232',
                           'M6265',
                           'P4126',
                           'R516',
                           'T5234',
                           'T5242')
  AND (ci.note IN ('(coordinating producer)',
                   '(creative consultant)',
                   '(executive producer)',
                   '(producer)',
                   '(producer: FUNimation)',
                   '(production coordinator)',
                   '(production team)',
                   '(technical director)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('37');