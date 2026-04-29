
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
                   'writer')
  AND (ci.note IN ('(assistant producer)',
                   '(executive producer)',
                   '(producer)',
                   '(production accountant)',
                   '(production assistant) (as Mark Jhon Mata)',
                   '(production assistant)',
                   '(video tape)',
                   '(writer)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND n.name_pcode_nf IN ('A4252',
                           'A5352',
                           'B625',
                           'D1352',
                           'D6565',
                           'G6261',
                           'H5616',
                           'J242',
                           'J2453',
                           'J5162',
                           'M2453',
                           'M2523',
                           'M6254',
                           'M6326',
                           'P3625',
                           'R2452',
                           'R3162',
                           'S4153',
                           'V2365',
                           'Y253')
  AND it1.id IN ('19');