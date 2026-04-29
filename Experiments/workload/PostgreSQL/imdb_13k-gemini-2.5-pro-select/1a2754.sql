
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
     WHERE ROLE IN ('actress',
                   'costume designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Argentina',
                    'Chile',
                    'Estonia',
                    'Germany',
                    'Ireland',
                    'Morocco',
                    'Puerto Rico',
                    'Serbia',
                    'Slovakia',
                    'Sweden',
                    'Taiwan',
                    'Turkey',
                    'UK',
                    'USA')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Dallas, Texas, USA',
                    'France',
                    'Minneapolis, Minnesota, USA',
                    'Moscow, Russia',
                    'New Orleans, Louisiana, USA',
                    'New York, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Vienna, Austria');