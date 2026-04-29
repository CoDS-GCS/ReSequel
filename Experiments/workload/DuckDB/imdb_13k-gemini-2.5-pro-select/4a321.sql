
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('26')
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
JOIN aka_name AS an ON n.id = an.person_id
WHERE (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4252',
                           'C5435',
                           'D1262',
                           'D1352',
                           'D526',
                           'E6241',
                           'G5263',
                           'J412',
                           'J4524',
                           'J5235',
                           'J5351',
                           'L4521',
                           'M4535',
                           'M4542',
                           'M6145',
                           'M6541',
                           'N3412',
                           'N3516',
                           'P4521',
                           'R2356',
                           'R25',
                           'R2632',
                           'S2516',
                           'S2625',
                           'Y252'))
  AND (ci.note IN ('(executive producer)',
                   '(office coordinator)',
                   '(producer)',
                   '(production assistant)',
                   '(script supervisor)',
                   '(senior series producer)',
                   '(story)',
                   '(supervising producer)',
                   '(talent coordinator)',
                   '(writer)')
       OR ci.note IS NULL);