
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Musical',
                   'Romance',
                   'Thriller')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:Atp',
                   'Australia:MA',
                   'Canada:G',
                   'Italy:VM14',
                   'Philippines:PG-13',
                   'South Korea:18',
                   'Spain:13',
                   'Spain:18',
                   'UK:PG',
                   'USA:Approved',
                   'USA:PG',
                   'USA:TV-PG',
                   'West Germany:18',
                   'West Germany:6')
  AND rt.role IN ('production designer')
  AND n.gender IN ('f');