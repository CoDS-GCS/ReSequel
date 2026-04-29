
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(archive footage)',
                   '(first assistant accountant) (uncredited)',
                   '(head writer script)',
                   '(idea)',
                   '(producer)',
                   '(production accountant)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A4563',
                           'A5236',
                           'B6162',
                           'C5362',
                           'C652',
                           'M326',
                           'M4362',
                           'N2532',
                           'R263',
                           'S1235',
                           'T5623'))
  AND it1.id IN ('37');