 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Family',
                   'Romance',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:Atp',
                   'Belgium:KT',
                   'Canada:PG',
                   'Finland:K-18',
                   'Iceland:L',
                   'New Zealand:R16',
                   'Norway:18',
                   'Singapore:PG',
                   'Singapore:R21',
                   'Switzerland:12',
                   'USA:X')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 2015
  AND t.production_year > 1975;