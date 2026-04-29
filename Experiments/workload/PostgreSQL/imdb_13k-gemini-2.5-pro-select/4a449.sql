
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A2416',
                           'A5356',
                           'B6535',
                           'E4213',
                           'G6323',
                           'J252',
                           'J5145',
                           'K3152',
                           'L6512',
                           'M5345',
                           'M625',
                           'M6262',
                           'M6352',
                           'M6363',
                           'N6416',
                           'N6521',
                           'S123',
                           'S6523',
                           'V2535'))
  AND (ci.note IN ('(associate producer)',
                   '(insurance broker)',
                   '(producer)',
                   '(production secretary)',
                   '(segment producer)',
                   '(story editor)')
       OR ci.note IS NULL);