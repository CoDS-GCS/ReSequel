
SELECT COUNT(*)
FROM name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON rt.id = ci.role_id
WHERE n.gender IS NULL
  AND n.name_pcode_nf IN ('A3652',
                           'A4215',
                           'B4525',
                           'B5163',
                           'B525',
                           'B6514',
                           'C4323',
                           'C6431',
                           'E6232',
                           'G1623',
                           'J2452',
                           'J4214',
                           'J426',
                           'J5262',
                           'J5356',
                           'K3652',
                           'M2516',
                           'O4162',
                           'P2524',
                           'R1635',
                           'R5162',
                           'T512',
                           'T5631')
  AND (ci.note IN ('(assistant producer)',
                   '(associate executive producer)',
                   '(associate producer) (as Jocelyn Mangilit-Tarce)',
                   '(associate producer)',
                   '(ccm in-house director)',
                   '(director of photography)',
                   '(executive producer)',
                   '(producer) (as Jules Levy)',
                   '(producer)',
                   '(production assistant)',
                   '(story)',
                   '(written by)')
       OR ci.note IS NULL)
  AND rt.role IN ('cinematographer',
                   'composer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
  AND it1.id IN ('32');