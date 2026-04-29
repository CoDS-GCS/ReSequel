 
 WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Adult',
                   'Adventure',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Romance',
                   'Thriller')
     AND mi2.info_type_id = '4'
     AND mi2.info IN ('Filipino',
                   'Finnish',
                   'French',
                   'Greek',
                   'Hindi',
                   'Spanish',
                   'Telugu',
                   'Turkish'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 1990
  AND t.production_year > 1950
  AND kt.kind IN ('movie',
                  'tv movie')
  AND rt.role IN ('actress',
                  'miscellaneous crew')
  AND n.gender IN ('f');