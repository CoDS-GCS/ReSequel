
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
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
  AND mi1.info IN ('Argentina:16',
                    'Iceland:14',
                    'India:U',
                    'Mexico:A',
                    'Norway:10',
                    'Norway:15',
                    'Peru:18',
                    'South Korea:18',
                    'UK:15',
                    'USA:Unrated',
                    'West Germany:12',
                    'West Germany:16')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('Peru:1987',
                    'Peru:1988',
                    'Peru:1989');