
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3542',
                           'B6352',
                           'B6525',
                           'C4',
                           'D5216',
                           'E254',
                           'E6254',
                           'F1625',
                           'I5635',
                           'J2131',
                           'J5164',
                           'J5215',
                           'J5434',
                           'N35',
                           'O3236',
                           'O4253',
                           'P4141',
                           'P6412',
                           'S5324',
                           'S5432',
                           'S6536',
                           'U4142',
                           'Z6536'))
  AND (ci.note IN ('(associate producer)',
                   '(network administrator)',
                   '(producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actor',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer'))
  AND (it1.id IN ('31'));