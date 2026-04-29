WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Comedy',
                   'Crime',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Short')
     AND mi2.info_type_id = '5'
     AND mi2.info IN ('Australia:M',
                   'Australia:PG',
                   'Iceland:12',
                   'Iceland:16',
                   'Iceland:L',
                   'Norway:15',
                   'Singapore:M18',
                   'Spain:T',
                   'USA:Unrated'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND rt.role IN ('composer',
                  'editor')
  AND n.gender IN ('f',
                   'm');