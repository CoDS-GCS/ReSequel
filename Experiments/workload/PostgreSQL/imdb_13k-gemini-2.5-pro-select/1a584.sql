 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1990
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
                   'Romance')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:PG',
                   'Canada:13+',
                   'Canada:14A',
                   'France:U',
                   'Germany:12',
                   'Singapore:PG',
                   'Sweden:11',
                   'Switzerland:7')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IN ('m');