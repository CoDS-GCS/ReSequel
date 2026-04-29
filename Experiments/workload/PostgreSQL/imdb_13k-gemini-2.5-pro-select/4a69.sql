WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IS NULL
     AND name_pcode_nf IN ('B52',
                           'B6325',
                           'E5252',
                           'G4562',
                           'G5245',
                           'J6535',
                           'K6232',
                           'M6452',
                           'P4256',
                           'R5235',
                           'S3152')),
     filtered_role AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')),
     filtered_info_type AS
  (SELECT id
   FROM info_type
   WHERE id IN ('25'))
SELECT COUNT(*)
FROM filtered_name AS n
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN filtered_info_type AS it1 ON pi1.info_type_id = it1.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN filtered_role AS rt ON ci.role_id = rt.id
WHERE (ci.note IN ('(creator)',
                   '(producer)',
                   '(production coordinator)',
                   '(written by)')
       OR ci.note IS NULL);