
SELECT COUNT(*)
FROM
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('D4151',
                           'D5136',
                           'E5421',
                           'K2353',
                           'K6231',
                           'N3536',
                           'N6153',
                           'S3246',
                           'S3535',
                           'V5316',
                           'V6325',
                           'Z612')) AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE rt.role IN ('actress',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('22')
  AND (ci.note IN ('(creator)',
                   '(script supervisor)')
       OR ci.note IS NULL);