 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IS NULL
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('producer',
                   'writer')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('8')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('6')
WHERE t.production_year BETWEEN 1925 AND 1975
  AND mi1.info IN ('Austria',
                    'Brazil',
                    'Canada',
                    'Czechoslovakia',
                    'East Germany',
                    'France',
                    'Germany',
                    'Hong Kong',
                    'Hungary',
                    'India',
                    'Japan',
                    'Poland',
                    'Portugal',
                    'Romania',
                    'Sweden')
  AND mi2.info IN ('Mono',
                    'Silent');