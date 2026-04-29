WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1990
     AND t.production_year >= 1950
     AND t.title IN ('(#1.36)',
                   '(#1.391)',
                   '(#1.399)',
                   '(#1.436)',
                   '(#5.12)',
                   '(#8.8)',
                   'A Star Is Born',
                   'Airplane!',
                   'Blood',
                   'Cannonball Run II',
                   'Crossed Swords',
                   'Diplomatic Immunity',
                   'Family Affair',
                   'Mans Best Friend',
                   'Pillow Talk',
                   'Silent Night, Deadly Night',
                   'The Deputy',
                   'The Great Impostor',
                   'The Human Factor')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'editor')),
     filtered_mi1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi2.movie_id
   FROM movie_info AS mi2
   WHERE mi2.info_type_id IN ('4')
     AND mi2.info IN ('Dutch',
                    'English',
                    'Malayalam',
                    'Norwegian',
                    'Serbo-Croatian'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;