
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '8'
  AND mi1.info IN ('Czechoslovakia',
                   'Georgia',
                   'Germany',
                   'Malaysia',
                   'South Africa',
                   'Sweden',
                   'Switzerland',
                   'USA')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Czech',
                   'English',
                   'French',
                   'Georgian',
                   'Malay',
                   'None',
                   'Swiss German')
  AND rt.role IN ('composer',
                  'editor')
  AND n.gender IN ('f',
                   'm');