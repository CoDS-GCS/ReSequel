 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE it1.id = '8'
  AND it2.id = '4'
  AND t.production_year <= 2015
  AND t.production_year > 1990
  AND mi1.info IN ('Denmark',
                   'Israel',
                   'Mexico',
                   'Serbia',
                   'Taiwan')
  AND mi2.info IN ('English',
                   'Mandarin',
                   'Serbian')
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND rt.role IN ('costume designer')
  AND n.gender IN ('m');