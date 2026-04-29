WITH filtered_n AS
  (SELECT id
   FROM name
   WHERE (gender IN ('f',
                    'm')
          OR gender IS NULL)
     AND (name_pcode_nf IN ('A4524',
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
          OR name_pcode_nf IS NULL))
SELECT COUNT(*)
FROM filtered_n AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
WHERE (ci.note IN ('(credit only)',
                   '(executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(voice) (uncredited)',
                   '(voice)')
       OR ci.note IS NULL)
  AND pi1.info_type_id IN ('25')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer'));