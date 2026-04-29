
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
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
     WHERE ROLE IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('Afrikaans',
                    'Albanian',
                    'Armenian',
                    'Czech',
                    'English',
                    'Estonian',
                    'Filipino',
                    'Malayalam',
                    'Mandarin',
                    'Portuguese',
                    'Russian',
                    'Serbian',
                    'Tamil',
                    'Telugu',
                    'Urdu')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('118',
                    '75',
                    '82',
                    '83',
                    'UK:15',
                    'USA:30',
                    'USA:88');