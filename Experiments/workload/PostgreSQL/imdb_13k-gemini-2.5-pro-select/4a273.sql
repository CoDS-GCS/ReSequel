
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('D5132',
                           'D5362',
                           'F6324',
                           'J262',
                           'J5141',
                           'J5163',
                           'J53',
                           'R1632',
                           'R1634',
                           'R412',
                           'R4126')
  AND (ci.note IN ('(co-executive producer)',
                   '(producer)',
                   '(production assistant)',
                   '(sales representative)',
                   '(supervising producer)',
                   '(technical supervisor)',
                   '(writer)')
       OR ci.note IS NULL)
  AND rt.role IN ('costume designer',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('22');