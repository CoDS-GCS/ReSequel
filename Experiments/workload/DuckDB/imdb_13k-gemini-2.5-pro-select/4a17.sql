
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3653',
                           'A46',
                           'C6241',
                           'G535',
                           'G6262',
                           'I6524',
                           'J4252',
                           'J521',
                           'K261',
                           'L25',
                           'M2435',
                           'M5253',
                           'M6213',
                           'R145',
                           'R1525',
                           'R521',
                           'S3136',
                           'S3542',
                           'S436',
                           'S5165',
                           'T5251',
                           'W3632',
                           'Y6523'))
  AND (ci.note IN ('(associate producer)',
                   '(co-producer)',
                   '(credit only)',
                   '(executive producer)',
                   '(on-set craft)',
                   '(post producer)',
                   '(producer)',
                   '(production assistant)',
                   '(production staff)',
                   '(script supervisor)',
                   '(stage manager)',
                   '(voice) (as Mike Donovan)',
                   '(voice: Japanese version)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND it1.id IN ('37');