 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 + 1 AND 2015
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adult',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Horror',
                   'Mystery',
                   'Short')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Arabic',
                   'Danish',
                   'French',
                   'German',
                   'Hindi',
                   'Italian',
                   'Norwegian',
                   'Russian',
                   'Swedish')
  AND rt.role IN ('editor',
                  'production designer')
  AND n.gender IN ('m');