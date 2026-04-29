
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
                   'tv movie',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Australia',
                    'Czechoslovakia',
                    'East Germany',
                    'France',
                    'Germany',
                    'Hong Kong',
                    'Hungary',
                    'Italy',
                    'Mexico',
                    'Norway',
                    'South Korea',
                    'Soviet Union',
                    'USA',
                    'Yugoslavia')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('14',
                    '50',
                    '70',
                    '83',
                    '94');