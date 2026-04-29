WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('C4625',
                           'E4546',
                           'F3624',
                           'G5432',
                           'G6231',
                           'H3653',
                           'H6323',
                           'I352',
                           'J5125',
                           'L2642',
                           'L626',
                           'M2425',
                           'P3653',
                           'R2632',
                           'S3152',
                           'T534',
                           'T6523',
                           'V2346',
                           'V4656')),
     filtered_roles AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'producer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN aka_name AS an ON fn.id = an.person_id
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN filtered_roles AS fr ON ci.role_id = fr.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE it1.id IN ('32')
  AND (ci.note IN ('(executive producer)',
                   '(producer)',
                   '(series creator)',
                   '(writer)')
       OR ci.note IS NULL);