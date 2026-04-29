
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
     WHERE ROLE IN ('actress',
                   'cinematographer',
                   'editor',
                   'producer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Drama',
                    'Family',
                    'Game-Show',
                    'History',
                    'Music',
                    'Mystery',
                    'Romance',
                    'Sci-Fi',
                    'Short',
                    'Sport',
                    'War')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Czech',
                    'Filipino',
                    'Finnish',
                    'Georgian',
                    'Hindi',
                    'Hungarian',
                    'Japanese',
                    'Malayalam',
                    'Norwegian',
                    'Polish',
                    'Russian',
                    'Serbo-Croatian',
                    'Spanish');