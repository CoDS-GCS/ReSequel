
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
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND mi1.info_type_id = '8'
  AND mi1.info IN ('Argentina',
                   'Australia',
                   'East Germany',
                   'Finland',
                   'Poland',
                   'UK',
                   'West Germany',
                   'Yugoslavia')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('English',
                   'Finnish',
                   'German',
                   'Polish',
                   'Serbo-Croatian',
                   'Spanish')
  AND rt.role IN ('director')
  AND n.gender IN ('f');