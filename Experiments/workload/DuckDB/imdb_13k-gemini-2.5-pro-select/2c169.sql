WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#4.35)',
                   '(#5.11)',
                   'Der Unfall',
                   'Justice',
                   'La porteuse de pain',
                   'Lady in the Dark',
                   'Letter from an Unknown Woman',
                   'Navy Blues',
                   'Somerset',
                   'The Photographer',
                   'The Thief',
                   'Three Men in a Boat')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('m')
  AND rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'guest',
                   'producer')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:18',
                    'Argentina:Atp',
                    'Finland:K-12',
                    'Finland:K-18',
                    'Finland:S',
                    'Germany:12',
                    'India:U',
                    'Italy:VM18',
                    'Portugal:M/12',
                    'Spain:13',
                    'USA:R')
  AND it2.id IN ('8')
  AND mi2.info IN ('Argentina',
                    'Belgium',
                    'France',
                    'India',
                    'Italy',
                    'USA');