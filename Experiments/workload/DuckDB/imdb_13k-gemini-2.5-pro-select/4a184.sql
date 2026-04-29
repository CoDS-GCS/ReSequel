
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON ci.person_id = pi1.person_id
AND n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
AND ci.person_id = an.person_id
AND an.person_id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A5365',
                           'F6524',
                           'G656',
                           'P4263',
                           'R4141',
                           'S2515',
                           'S5362',
                           'T262')
  AND (ci.note IN ('(assistant production coordinator)',
                   '(producer)',
                   '(supervising producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('composer',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('37');