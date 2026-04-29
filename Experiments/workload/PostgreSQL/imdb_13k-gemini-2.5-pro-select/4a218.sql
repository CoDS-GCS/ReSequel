WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND name_pcode_nf IN ('A4252',
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
                           'Y253')),
     filtered_role AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')),
     filtered_info_type AS
  (SELECT id
   FROM info_type
   WHERE id IN ('19'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_role AS rt ON ci.role_id = rt.id
WHERE (ci.note IN ('(assistant producer)',
                   '(executive producer)',
                   '(producer)',
                   '(production accountant)',
                   '(production assistant) (as Mark Jhon Mata)',
                   '(production assistant)',
                   '(video tape)',
                   '(writer)')
       OR ci.note IS NULL);