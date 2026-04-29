
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A4253',
                           'B1425',
                           'C6236',
                           'C6414',
                           'D132',
                           'D2562',
                           'D5416',
                           'E2365',
                           'E3632',
                           'F6523',
                           'I2623',
                           'J523',
                           'J5253',
                           'K625',
                           'K6265',
                           'L6162',
                           'M5431',
                           'M6262',
                           'P3523',
                           'R2636',
                           'R512',
                           'T6326',
                           'V2534')
  AND (ci.note IN ('(IT specialist)',
                   '(executive producer)',
                   '(executive script consultant)',
                   '(line producer)',
                   '(location manager)',
                   '(producer)',
                   '(production coordinator)',
                   '(studio manager)')
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
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'));