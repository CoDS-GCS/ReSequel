
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 + 1 AND 1990
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND n.gender IN ('f')
  AND rt.role IN ('editor')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Game-Show',
                   'Music',
                   'Romance',
                   'Short')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Cantonese',
                   'Dutch',
                   'English',
                   'Finnish',
                   'German',
                   'Greek',
                   'Hindi',
                   'Polish',
                   'Serbo-Croatian');