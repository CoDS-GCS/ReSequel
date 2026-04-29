
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
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'miscellaneous crew',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Fantasy',
                    'Game-Show',
                    'History',
                    'Mystery',
                    'Reality-TV',
                    'Short',
                    'Sport',
                    'War')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Albania',
                    'Chile',
                    'East Germany',
                    'Federal Republic of Yugoslavia',
                    'Iceland');