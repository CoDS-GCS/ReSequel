
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '8'
  AND mi1.info IN ('Brazil',
                   'Canada',
                   'Denmark',
                   'Egypt',
                   'Germany',
                   'Hong Kong',
                   'Portugal',
                   'Romania',
                   'Russia',
                   'South Korea',
                   'Soviet Union',
                   'Spain',
                   'Sweden',
                   'UK')
  AND t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Arabic',
                   'Cantonese',
                   'Danish',
                   'English',
                   'German',
                   'Korean',
                   'Portuguese',
                   'Romanian',
                   'Russian',
                   'Swedish')
  AND rt.role IN ('costume designer')
  AND n.gender IN ('m');