WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND name_pcode_nf IN ('C6242',
                           'C6261',
                           'J2425',
                           'K4524',
                           'L215',
                           'L232',
                           'L2435',
                           'M6263',
                           'N2463',
                           'R4125',
                           'T6262')),
     filtered_role AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')),
     filtered_info_type AS
  (SELECT id
   FROM info_type
   WHERE id IN ('26'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_role AS rt ON ci.role_id = rt.id
WHERE (ci.note IN ('(director of photography)',
                   '(executive producer)',
                   '(financial analyst)',
                   '(i-post account head) (as Rafael San Agustin)',
                   '(producer)',
                   '(production accountant) (as Kelly Schwartz)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(writer) (as Marga Labrador)')
       OR ci.note IS NULL);