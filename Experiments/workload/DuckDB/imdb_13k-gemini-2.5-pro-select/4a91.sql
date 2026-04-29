
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('D5612',
                           'E141',
                           'E3565',
                           'J3623',
                           'S3145',
                           'T1365',
                           'T6234',
                           'Y2545',
                           'Y5216')
  AND (ci.note IN ('(storyliner)',
                   '(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'writer')
  AND it1.id IN ('19');