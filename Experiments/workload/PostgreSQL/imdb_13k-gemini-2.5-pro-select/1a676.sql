 
 WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Romance')
     AND mi2.info_type_id = '5'
     AND mi2.info IN ('France:U',
                   'Germany:18',
                   'Philippines:PG-13',
                   'Singapore:NC-16',
                   'UK:12',
                   'USA:PG-13',
                   'USA:Unrated'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND rt.role IN ('editor')
  AND n.gender IN ('f',
                   'm');