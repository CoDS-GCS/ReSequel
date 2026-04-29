 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 1990
  AND t.production_year > 1950
  AND kt.kind IN ('tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Documentary',
                   'Short')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Filipino',
                   'Finnish',
                   'Italian',
                   'Spanish')
  AND rt.role IN ('editor',
                  'production designer')
  AND n.gender IN ('f');