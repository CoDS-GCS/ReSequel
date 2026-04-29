WITH filtered_movies AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1925 AND 1975
     AND mi1.info_type_id IN ('103',
                  '2')
     AND mi1.info IN ('Color')
     AND mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 1000.0 AND 10000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 3.0 AND 7.0)
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN cast_info AS ci ON fm.movie_id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('C6421',
                           'C6423',
                           'C6424',
                           'C6425',
                           'C6426',
                           'F6524',
                           'F6532',
                           'R2632',
                           'V4356',
                           'W4362')
  AND pi1.info_type_id IN ('37');