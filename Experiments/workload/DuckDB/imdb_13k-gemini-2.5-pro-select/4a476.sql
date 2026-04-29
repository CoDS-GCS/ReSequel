
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
  AND n.name_pcode_nf IN ('A3651',
                           'B463',
                           'C6421',
                           'E3451',
                           'J516',
                           'J5162',
                           'K1521',
                           'L262',
                           'M2436',
                           'V5215')
  AND (ci.note IN ('(adaptation)',
                   '(executive producer)',
                   '(producer)',
                   '(production accountant)',
                   '(production coordinator)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('34');