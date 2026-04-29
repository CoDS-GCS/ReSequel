WITH name_an AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   WHERE n.gender IS NULL
     AND n.name_pcode_nf IN ('A4145',
                           'B6535',
                           'B6562',
                           'G6435',
                           'M242',
                           'M6514',
                           'P3642',
                           'R1624')),
     name_an_pi AS
  (SELECT na.person_id
   FROM name_an AS na
   JOIN person_info AS pi1 ON na.person_id = pi1.person_id
   JOIN info_type AS it1 ON pi1.info_type_id = it1.id
   WHERE it1.id IN ('25'))
SELECT COUNT(*)
FROM name_an_pi AS napi
JOIN cast_info AS ci ON napi.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer')
  AND (ci.note IN ('(associate producer)',
                   '(director of photography)',
                   '(executive producer)',
                   '(production staff)',
                   '(program liaison) (as Serapio Rosal Jr.)',
                   '(title designer)')
       OR ci.note IS NULL);