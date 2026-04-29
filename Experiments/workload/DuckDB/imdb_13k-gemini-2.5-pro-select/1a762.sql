
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Adult',
                   'Adventure',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Romance',
                   'Thriller',
                   'War')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Australia:M',
                   'Finland:K-16',
                   'Sweden:15',
                   'UK:U',
                   'USA:Approved',
                   'USA:TV-G',
                   'USA:X',
                   'West Germany:16')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 1975
  AND t.production_year > 1925;