WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('episode',
                   'movie')
     AND t.production_year BETWEEN 1925 AND 2015),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('107',
                  '17',
                  '3')
     AND mi1.info IN ('Adult',
                    'Adventure',
                    'Fantasy',
                    'History',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'War',
                    'Western')),
     filtered_mii1 AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 1000.0 AND 10000.0),
     filtered_mii2 AS
  (SELECT mii2.movie_id
   FROM movie_info_idx AS mii2
   WHERE mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 0.0 AND 4.0),
     filtered_n AS
  (SELECT n.id
   FROM name AS n
   WHERE (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('C4624',
                           'C6235',
                           'G1641',
                           'G6212',
                           'J4262',
                           'M2424',
                           'M2425',
                           'M2465',
                           'M5236',
                           'M5456',
                           'M6256',
                           'O4212',
                           'R252',
                           'S1652')
          OR n.name_pcode_nf IS NULL)),
     filtered_ci AS
  (SELECT ci.person_id,
          ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE (ci.note IN ('(producer)',
                   '(writer)')
          OR ci.note IS NULL)
     AND rt.role IN ('actress',
                   'cinematographer',
                   'director',
                   'producer',
                   'writer')),
     filtered_pi1 AS
  (SELECT pi1.person_id
   FROM person_info AS pi1
   WHERE pi1.info_type_id IN ('19'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_mi1 ON t.id = filtered_mi1.movie_id
JOIN filtered_mii1 ON t.id = filtered_mii1.movie_id
JOIN filtered_mii2 ON t.id = filtered_mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_pi1 AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id;