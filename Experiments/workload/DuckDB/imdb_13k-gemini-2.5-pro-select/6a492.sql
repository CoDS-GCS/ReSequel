WITH filtered_movies AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   WHERE kt.kind IN ('movie')
     AND t.production_year BETWEEN 1875 AND 1975
     AND mi1.info_type_id IN ('15',
                  '6',
                  '94')
     AND mi1.info IN ('Silent')
     AND mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 10000.0
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
WHERE (ci.note IN ('(producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A6362',
                           'B6563',
                           'E3632',
                           'F6362',
                           'F6523',
                           'F6524',
                           'F6526',
                           'F6532',
                           'G6216',
                           'H6163',
                           'R1635',
                           'R1636',
                           'R2632',
                           'S2534',
                           'W4362')
  AND pi1.info_type_id IN ('34');