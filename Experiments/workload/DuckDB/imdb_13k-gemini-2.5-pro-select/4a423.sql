
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
WHERE n.gender IN ('f')
  AND n.name_pcode_nf IN ('A2362',
                           'A5242',
                           'J3246',
                           'K6523',
                           'M2146',
                           'P2636',
                           'Y5213')
  AND (ci.note IN ('(dancer: title sequence)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'miscellaneous crew',
                   'writer')
  AND it1.id IN ('31');