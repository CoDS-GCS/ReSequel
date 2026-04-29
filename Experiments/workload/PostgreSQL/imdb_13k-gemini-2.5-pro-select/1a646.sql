 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Drama')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Finland:S',
                   'Iceland:12',
                   'Iceland:L',
                   'Norway:16',
                   'Sweden:15',
                   'USA:Approved',
                   'USA:R',
                   'West Germany:12',
                   'West Germany:18')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                  'actress')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
WHERE t.production_year <= 1990
  AND t.production_year > 1950;