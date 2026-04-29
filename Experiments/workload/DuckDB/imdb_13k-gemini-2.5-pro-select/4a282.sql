
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4214',
                           'A5142',
                           'A5162',
                           'A6521',
                           'C6432',
                           'E6262',
                           'J2452',
                           'K315',
                           'K4242',
                           'L4362',
                           'M153',
                           'S2324',
                           'S2632'))
  AND (ci.note IN ('(as Sigrid M. Schnückel)',
                   '(executive producer)',
                   '(location manager)',
                   '(producer)',
                   '(production assistant) (as Keila Marie Celso)',
                   '(script writer)')
       OR ci.note IS NULL)
  AND (rt.role IN ('actress',
                   'cinematographer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (it1.id IN ('37'));