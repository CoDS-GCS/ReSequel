WITH valid_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
   JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie')
     AND mi1.info_type_id IN ('16',
                  '3')
     AND mi1.info IN ('Adult',
                    'Adventure',
                    'Biography',
                    'Fantasy',
                    'History',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Sport')
     AND mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float >= 0.0
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float <= 1000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float <= 4.0
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float >= 0.0)
SELECT COUNT(*)
FROM valid_movies AS vm
JOIN cast_info AS ci ON vm.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress',
                   'director')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('B3625',
                           'B3626',
                           'B6164',
                           'D5251',
                           'J2612',
                           'J4524',
                           'J5262',
                           'M2424',
                           'P436',
                           'R53',
                           'S252',
                           'S5253')
  AND pi1.info_type_id IN ('37');