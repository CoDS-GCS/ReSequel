
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('C6242',
                           'C6261',
                           'J2425',
                           'K4524',
                           'L215',
                           'L232',
                           'L2435',
                           'M6263',
                           'N2463',
                           'R4125',
                           'T6262')
  AND (ci.note IN ('(director of photography)',
                   '(executive producer)',
                   '(financial analyst)',
                   '(i-post account head) (as Rafael San Agustin)',
                   '(producer)',
                   '(production accountant) (as Kelly Schwartz)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(writer) (as Marga Labrador)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('26');