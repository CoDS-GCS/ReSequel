
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON it1.id = pi1.info_type_id
WHERE rt.role IN ('actress',
                   'composer',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer')
  AND (ci.note IN ('(as Lori Eskowitz)',
                   '(executive producer)',
                   '(president: Tyler Perry Studios)',
                   '(producer)',
                   '(production accountant)',
                   '(talent coordinator)',
                   '(technical account head)',
                   '(voice)')
       OR ci.note IS NULL)
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A26',
                           'F253',
                           'J23',
                           'J5262',
                           'K36',
                           'K3654',
                           'L2',
                           'L2136',
                           'L6232',
                           'M2532',
                           'O26',
                           'P4612',
                           'R525',
                           'S3146',
                           'W4163'))
  AND it1.id IN ('19');