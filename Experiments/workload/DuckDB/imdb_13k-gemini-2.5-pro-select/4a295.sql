WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     AND name_pcode_nf IN ('A1341',
                           'C3252',
                           'E2343',
                           'F4652',
                           'K6532',
                           'S3152'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('37')
  AND (ci.note IN ('(script supervisor)',
                   '(uncredited)',
                   '(writer)')
       OR ci.note IS NULL);