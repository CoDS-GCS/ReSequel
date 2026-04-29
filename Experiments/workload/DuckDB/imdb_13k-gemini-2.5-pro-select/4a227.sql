
SELECT COUNT(*)
FROM name AS n
INNER JOIN cast_info AS ci ON n.id = ci.person_id
INNER JOIN person_info AS pi1 ON n.id = pi1.person_id
INNER JOIN aka_name AS an ON n.id = an.person_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4524',
                           'A531',
                           'C2421',
                           'D5235',
                           'D5425',
                           'D5431',
                           'D545',
                           'E145',
                           'E2565',
                           'E425',
                           'E6536',
                           'H5624',
                           'J3165',
                           'J4215',
                           'J651',
                           'L41',
                           'M2615',
                           'M6314',
                           'N3516',
                           'R1216',
                           'R1563',
                           'R2326',
                           'S252',
                           'Y2321')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(credit only)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(voice) (uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('25');