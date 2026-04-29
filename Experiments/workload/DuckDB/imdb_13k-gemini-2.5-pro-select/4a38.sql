WITH filtered_names AS
  (SELECT id
   FROM name
   WHERE (gender IN ('f')
          OR gender IS NULL)
     AND name_pcode_nf IN ('F6531',
                           'J2453',
                           'L52',
                           'M2426',
                           'S3153',
                           'S4124'))
SELECT COUNT(*)
FROM filtered_names AS fn
JOIN cast_info AS ci ON fn.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi ON fn.id = pi.person_id
JOIN info_type AS it1 ON pi.info_type_id = it1.id
JOIN aka_name AS an ON fn.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actress')
  AND it1.id IN ('19');