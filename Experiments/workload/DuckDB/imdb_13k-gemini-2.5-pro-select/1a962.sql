
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Crime',
                   'Drama',
                   'Horror',
                   'Short',
                   'Thriller')
  AND t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('movie',
                  'video movie')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Canada:14A',
                   'Iceland:16',
                   'Iceland:L',
                   'Portugal:M/12',
                   'UK:15',
                   'UK:18',
                   'USA:Not Rated')
  AND rt.role IN ('director')
  AND n.gender IN ('f');