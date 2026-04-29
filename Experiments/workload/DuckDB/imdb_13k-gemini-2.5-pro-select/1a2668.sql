
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Germany:12',
                    'Germany:16',
                    'Hungary:16',
                    'India:A',
                    'Malaysia:U',
                    'New Zealand:PG',
                    'Portugal:M/6',
                    'Spain:X',
                    'Sweden:11',
                    'USA:TV-Y7',
                    'USA:Unrated')
  AND it2.id IN ('8')
  AND mi2.info IN ('Austria',
                    'Brazil',
                    'China',
                    'Denmark',
                    'Iceland',
                    'Ireland',
                    'Philippines',
                    'Poland',
                    'Portugal',
                    'Romania',
                    'Spain',
                    'Turkey',
                    'West Germany')
  AND rt.role IN ('production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);