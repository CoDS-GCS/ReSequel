
SELECT COUNT(*)
FROM info_type AS it1
JOIN person_info AS pi1 ON it1.id = pi1.info_type_id
JOIN name AS n ON pi1.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE it1.id IN ('32')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('C4346',
                           'C4535',
                           'E3635',
                           'E625',
                           'G1546',
                           'J2124',
                           'J2362',
                           'J2526',
                           'J516',
                           'K1514',
                           'K2542',
                           'L6214',
                           'M2163',
                           'M3156',
                           'O4265',
                           'R21',
                           'R4136',
                           'S2523',
                           'S5212'))
  AND (ci.note IN ('(co-executive producer)',
                   '(executive producer)',
                   '(executive producer: TV3)',
                   '(exteriors)',
                   '(producer)',
                   '(screenplay)',
                   '(segment producer)',
                   '(technical advisor: Los Angeles Police Department) (as Chief Edward M. Davis)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer');