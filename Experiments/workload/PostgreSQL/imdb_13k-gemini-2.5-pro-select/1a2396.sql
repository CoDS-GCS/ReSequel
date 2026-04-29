 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'History',
                   'Romance',
                   'Thriller',
                   'Western')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '4'
AND mi2.info IN ('Cantonese',
                   'English',
                   'Finnish',
                   'German',
                   'Italian',
                   'Spanish',
                   'Tagalog')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 1990
  AND t.production_year > 1950;