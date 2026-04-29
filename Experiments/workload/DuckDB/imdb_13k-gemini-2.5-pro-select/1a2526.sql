WITH valid_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     valid_casts AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'cinematographer',
                   'production designer')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)),
     valid_movie_info1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     valid_movie_info2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   WHERE it2.id IN ('6')
     AND mi2.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'Dolby',
                    'Mono',
                    'Silent',
                    'Stereo'))
SELECT COUNT(*)
FROM valid_titles AS t
JOIN valid_casts AS ci ON t.id = ci.movie_id
JOIN valid_movie_info1 AS mi1 ON t.id = mi1.movie_id
JOIN valid_movie_info2 AS mi2 ON t.id = mi2.movie_id;