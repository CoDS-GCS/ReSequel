
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A5625',
                           'B6321',
                           'C4325',
                           'C6251',
                           'D5436',
                           'E6242',
                           'G1642',
                           'G6214',
                           'G6236',
                           'G6256',
                           'H4532',
                           'J2156',
                           'J341',
                           'J452',
                           'J5252',
                           'J6351',
                           'M2545',
                           'M6264',
                           'N4214',
                           'R1632',
                           'R2452',
                           'R5345',
                           'S5125',
                           'W5352')
  AND (ci.note IN ('(creative manager)',
                   '(creator)',
                   '(director of photography)',
                   '(executive producer)',
                   '(line producer)',
                   '(original concept)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(sales representative)',
                   '(scenario)',
                   '(shipping coordinator)',
                   '(writer)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('26'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'));