WITH movie_idx_candidates AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 1000.0 INTERSECT SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 7.0 AND 11.0)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_idx_candidates AS mic ON t.id = mic.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('11',
                  '2')
  AND mi1.info IN ('Black and White')
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress',
                   'editor')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5236',
                           'A5316',
                           'B652',
                           'D5362',
                           'G6253',
                           'I2141',
                           'J2532',
                           'L216',
                           'M6232',
                           'N2423',
                           'N2426',
                           'R1636',
                           'R526',
                           'S5262')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('31');