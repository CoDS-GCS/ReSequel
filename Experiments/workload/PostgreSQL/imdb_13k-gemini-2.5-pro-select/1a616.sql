 
 
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
                   'Comedy',
                   'Documentary',
                   'Drama')
  AND t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Australia:G',
                   'Australia:R',
                   'Canada:14A',
                   'Germany:12',
                   'Germany:18',
                   'Germany:6',
                   'Malaysia:U',
                   'Singapore:NC-16',
                   'Singapore:R21')
  AND rt.role IN ('costume designer',
                  'editor')
  AND n.gender IN ('f',
                   'm');