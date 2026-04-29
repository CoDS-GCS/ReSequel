 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1990 + 1 AND 2015
  AND kt.kind IN ('tv movie',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adult',
                   'Crime',
                   'Drama',
                   'Family',
                   'Mystery',
                   'Romance',
                   'Sci-Fi',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:MA',
                   'Germany:12',
                   'Germany:16',
                   'Germany:18',
                   'Hong Kong:IIB',
                   'Ireland:15A',
                   'Singapore:NC-16',
                   'Spain:18',
                   'Sweden:15',
                   'UK:U',
                   'USA:R')
  AND rt.role IN ('editor',
                  'production designer')
  AND n.gender IN ('m');