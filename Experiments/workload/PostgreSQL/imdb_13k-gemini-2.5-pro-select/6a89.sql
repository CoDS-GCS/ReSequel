
SELECT COUNT(*)
FROM movie_info_idx AS mii1
JOIN movie_info_idx AS mii2 ON mii1.movie_id = mii2.movie_id
JOIN title AS t ON mii1.movie_id = t.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 10000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 2.0 AND 5.0)
  AND t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'video movie'))
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('Stereo')
  AND (ci.note IN ('(archive footage)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'))
  AND n.gender IN ('f',
                    'm')
  AND (n.name_pcode_nf IN ('A4163',
                           'A5362',
                           'B6535',
                           'C6231',
                           'C6235',
                           'F6521',
                           'R1632',
                           'R2632',
                           'S3152')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('19');