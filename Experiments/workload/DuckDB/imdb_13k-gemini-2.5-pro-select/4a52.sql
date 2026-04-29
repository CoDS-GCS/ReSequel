
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A3651',
                           'C3252',
                           'D5423',
                           'D5424',
                           'G4542',
                           'G6253',
                           'I5262',
                           'J5326',
                           'K5165',
                           'R4141',
                           'S5152',
                           'S524'))
  AND (ci.note IN ('(production coordinator)',
                   '(voice)',
                   '(writer)')
       OR ci.note IS NULL);