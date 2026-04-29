
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A4151',
                           'A53',
                           'D4216',
                           'D6246',
                           'H4241',
                           'K3142',
                           'K3254',
                           'K6532',
                           'L3432',
                           'M4636',
                           'N163',
                           'N6165',
                           'O4241',
                           'S3216',
                           'S5453',
                           'V3615')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'miscellaneous crew')
  AND it1.id IN ('22')
  AND (ci.note IN ('(script supervisor)',
                   '(voice)')
       OR ci.note IS NULL);