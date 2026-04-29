
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('5')
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
  AND mi2.info_type_id IN ('8')
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
                    'West Germany');