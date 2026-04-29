
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('19')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2625',
                           'A6531',
                           'B6212',
                           'C6232',
                           'C6451',
                           'G4165',
                           'I5162',
                           'J2514',
                           'K3624',
                           'M2625',
                           'M6545',
                           'P5416',
                           'S1353',
                           'S3162',
                           'S6526',
                           'T4631',
                           'T5256',
                           'T5262',
                           'V6265'))
  AND (ci.note IN ('(archive footage)',
                   '(associate producer)',
                   '(creator)',
                   '(executive producer)',
                   '(planner)',
                   '(producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(production secretary)',
                   '(production)',
                   '(script coordinator)',
                   '(video segments)',
                   '(writer)')
       OR ci.note IS NULL);