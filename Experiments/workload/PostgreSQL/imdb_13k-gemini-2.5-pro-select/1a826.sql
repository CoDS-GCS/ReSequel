 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Adult',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Short',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:Atp',
                   'Argentina:X',
                   'Finland:K-18',
                   'Germany:6',
                   'Netherlands:AL',
                   'Portugal:M/6',
                   'Singapore:NC-16',
                   'Singapore:PG',
                   'Spain:T',
                   'Sweden:11',
                   'UK:12',
                   'UK:PG',
                   'USA:PG')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('producer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 2015
  AND t.production_year > 1925;