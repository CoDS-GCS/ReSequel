WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_nf IN ('A5362',
                           'B5253',
                           'C624',
                           'H6431',
                           'J5363',
                           'O4163',
                           'P6252',
                           'S3631'))
SELECT COUNT(*)
FROM filtered_name AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON fn.id = pi1.person_id
JOIN info_type AS it1 ON pi1.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE rt.role IN ('actor')
  AND it1.id IN ('37')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);