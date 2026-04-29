 
 
SELECT COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE n.gender IN ('f')
  AND rt.role IN ('production designer')
  AND t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adult',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Romance',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:13',
                   'Australia:M',
                   'Australia:MA',
                   'Australia:PG',
                   'Germany:16',
                   'Germany:18',
                   'Iceland:12',
                   'Norway:15',
                   'Portugal:M/12',
                   'UK:18',
                   'UK:R18',
                   'USA:R');