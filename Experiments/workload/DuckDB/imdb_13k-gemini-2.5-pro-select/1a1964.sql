
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '8'
AND mi1.info IN ('Argentina',
                   'Brazil',
                   'Chile',
                   'Czech Republic',
                   'Denmark',
                   'France',
                   'Greece',
                   'India',
                   'South Korea')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '4'
AND mi2.info IN ('Czech',
                   'Danish',
                   'English',
                   'Greek',
                   'Hindi',
                   'Korean',
                   'Portuguese',
                   'Spanish')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                  'production designer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
WHERE t.production_year <= 2015
  AND t.production_year > 1975;