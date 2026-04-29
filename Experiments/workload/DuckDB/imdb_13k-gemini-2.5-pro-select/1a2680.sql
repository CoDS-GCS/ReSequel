
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'guest',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    'Mono',
                    'Silent',
                    'Stereo')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Brazil',
                    'Czechoslovakia',
                    'France',
                    'India',
                    'Soviet Union',
                    'USA',
                    'West Germany');