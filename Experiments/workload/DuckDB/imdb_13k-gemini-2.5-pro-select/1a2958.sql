
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('100',
                    '16',
                    '21',
                    '25',
                    '60',
                    '62',
                    '72',
                    '82',
                    '86',
                    '87',
                    '9',
                    'Argentina:30',
                    'UK:50',
                    'USA:80')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Canada',
                    'Hungary',
                    'India',
                    'Israel',
                    'Mexico',
                    'Norway',
                    'South Korea',
                    'Turkey',
                    'UK');