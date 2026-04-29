
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND (ci.note IN ('(assistant to executive producer)',
                   '(co-producer)',
                   '(coordinating producer)',
                   '(director of photography) (as Romy Vitug)',
                   '(executive producer)',
                   '(producer)',
                   '(production coordinator)',
                   '(program associate)',
                   '(story editor)',
                   '(technical director)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND n.name_pcode_nf IN ('A5243',
                           'A5364',
                           'B6162',
                           'C452',
                           'D5165',
                           'D5246',
                           'D5351',
                           'G623',
                           'J2126',
                           'J5135',
                           'J5354',
                           'K6231',
                           'K6232',
                           'L6245',
                           'L6263',
                           'M2416',
                           'M6541',
                           'N2425',
                           'P3623',
                           'R5132',
                           'T352',
                           'T5212',
                           'T6212',
                           'Y2')
  AND it1.id IN ('37');