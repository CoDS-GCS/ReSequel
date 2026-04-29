
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A2313',
                           'C4526',
                           'C6245',
                           'E6245',
                           'F6362',
                           'F6531',
                           'F6535',
                           'J154',
                           'J2124',
                           'J5161',
                           'J5352',
                           'J6325',
                           'K3653',
                           'K5235',
                           'L6525',
                           'M2415',
                           'M6252',
                           'M6325',
                           'M6353',
                           'N2432',
                           'N3413',
                           'N3523',
                           'P3645',
                           'R5142',
                           'T5352')
  AND (ci.note IN ('(associate producer)',
                   '(co-executive producer)',
                   '(creator)',
                   '(location)',
                   '(operations manager)',
                   '(producer)',
                   '(production assistant)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('31');