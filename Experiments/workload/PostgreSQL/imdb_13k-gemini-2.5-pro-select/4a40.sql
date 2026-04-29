
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('C6252',
                           'D1616',
                           'D326',
                           'E6212',
                           'G6243',
                           'H4263',
                           'K6235',
                           'L6452',
                           'M6532',
                           'R1631',
                           'S2632',
                           'T3252')
  AND (ci.note IN ('(director of development)',
                   '(nurse)',
                   '(producer)',
                   '(production accountant)',
                   '(script supervisor)',
                   '(writer)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN
    (SELECT id
     FROM info_type
     WHERE id IN ('26'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'));