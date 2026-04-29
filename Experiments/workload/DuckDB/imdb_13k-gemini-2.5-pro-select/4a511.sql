
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5362',
                           'B6162',
                           'C6126',
                           'I5262',
                           'J54',
                           'K3525',
                           'M2346',
                           'P3653',
                           'R2524',
                           'R3542'))
  AND (ci.note IN ('(adprom manager)',
                   '(child acting coach)',
                   '(executive producer)',
                   '(production assistant)',
                   '(production coordinator)',
                   '(story editor)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'miscellaneous crew',
                   'producer')
  AND it1.id IN ('34');