
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Mystery',
                   'Romance',
                   'Short')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Australia:M',
                   'Germany:16',
                   'Netherlands:AL',
                   'Portugal:M/12',
                   'Sweden:15',
                   'UK:PG',
                   'UK:U',
                   'USA:Approved',
                   'USA:Not Rated',
                   'USA:Passed',
                   'West Germany:16')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 2015
  AND t.production_year > 1925;