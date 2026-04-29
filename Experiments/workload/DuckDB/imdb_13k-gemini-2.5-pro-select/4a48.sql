
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON rt.id = ci.role_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE rt.role IN ('actress',
                   'director',
                   'miscellaneous crew')
  AND it1.id IN ('19')
  AND n.gender IN ('f')
  AND n.name_pcode_nf IN ('A3425',
                           'B2562',
                           'B32',
                           'C3454',
                           'C4626',
                           'D526',
                           'D5656',
                           'E125',
                           'E1265',
                           'E4535',
                           'F4652',
                           'G64',
                           'M4525',
                           'M6362',
                           'M6452',
                           'N5316',
                           'R2416',
                           'S536',
                           'V4535',
                           'V5256',
                           'Y2365')
  AND (ci.note IN ('(dialogue coach)',
                   '(uncredited)')
       OR ci.note IS NULL);