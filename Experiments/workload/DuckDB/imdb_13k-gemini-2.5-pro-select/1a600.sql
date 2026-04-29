
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
                   'Adventure',
                   'Comedy',
                   'Drama',
                   'Family',
                   'Horror',
                   'Romance',
                   'Thriller')
  AND t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('episode',
                  'video movie')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Argentina:Atp',
                   'Canada:G',
                   'Germany:18',
                   'Netherlands:16',
                   'Singapore:M18',
                   'Singapore:PG',
                   'Sweden:11',
                   'Sweden:Btl',
                   'UK:15',
                   'UK:18',
                   'USA:PG',
                   'USA:Passed',
                   'West Germany:12',
                   'West Germany:18')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('m');