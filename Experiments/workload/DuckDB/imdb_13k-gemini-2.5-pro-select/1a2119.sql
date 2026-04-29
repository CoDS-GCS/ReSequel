WITH movies_with_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Animation',
                   'Biography',
                   'Comedy',
                   'Documentary',
                   'Horror',
                   'Short')
     AND mi2.info_type_id = '4'
     AND mi2.info IN ('Cantonese',
                   'French',
                   'German',
                   'Japanese',
                   'Korean',
                   'Swedish',
                   'Turkish'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movies_with_info AS mwi ON t.id = mwi.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year BETWEEN 1990 + 1 AND 2015
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND n.gender IN ('m')
  AND rt.role IN ('producer');