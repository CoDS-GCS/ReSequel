
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '8'
AND mi1.info IN ('Bulgaria',
                   'Czechoslovakia',
                   'Egypt',
                   'France',
                   'India',
                   'Italy',
                   'Portugal',
                   'Romania',
                   'Sweden')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '4'
AND mi2.info IN ('Arabic',
                   'Bulgarian',
                   'Czech',
                   'English',
                   'French',
                   'Portuguese',
                   'Romanian',
                   'Swedish',
                   'Telugu')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 1990
  AND t.production_year > 1950;