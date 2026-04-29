 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '8'
AND mi1.info IN ('Finland',
                   'Italy',
                   'Japan',
                   'South Korea',
                   'Soviet Union',
                   'Sweden',
                   'West Germany')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '4'
AND mi2.info IN ('Finnish',
                   'German',
                   'Italian',
                   'Japanese',
                   'Korean',
                   'Russian',
                   'Swedish')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('costume designer',
                  'production designer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
WHERE t.production_year <= 1975
  AND t.production_year > 1925;