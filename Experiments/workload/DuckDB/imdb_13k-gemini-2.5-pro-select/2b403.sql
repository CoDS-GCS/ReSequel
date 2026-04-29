WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('abandoned-by-father',
                     'calabria',
                     'crash-through-window',
                     'cypress-tree',
                     'fin-de-siècle',
                     'frankincense',
                     'hillbilly',
                     'learning-to-write-poetry',
                     'mapquest',
                     'platinum-island',
                     'rice-farmer',
                     'russian-national-anthem',
                     'sano-japan',
                     'spin-master',
                     'toulouse-lautrec',
                     'trip-around-the-world',
                     'troll',
                     'villa-magna-madrid',
                     'walt-disney-concert-hall'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('100',
                    '23',
                    '45',
                    '60',
                    '95',
                    'Argentina:30')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Dolby Digital',
                    'Mono',
                    'Stereo')
  AND rt.role IN ('miscellaneous crew',
                   'producer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);