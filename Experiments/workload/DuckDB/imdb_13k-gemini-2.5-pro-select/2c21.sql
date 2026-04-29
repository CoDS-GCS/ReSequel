WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND t.title IN ('(#1.1612)',
                   '(#2.167)',
                   'D-Day Remembered',
                   'Engrenage',
                   'Europe, Here We Come',
                   'Me and the Devil',
                   'Mivtsa Yonatan',
                   'Monkey Love',
                   'Soldier of Fortune',
                   'The Firm')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer',
                   'miscellaneous crew',
                   'production designer')
  AND it1.id IN ('3')
  AND mi1.info IN ('Animation',
                    'Biography',
                    'Documentary',
                    'Fantasy',
                    'Game-Show',
                    'History',
                    'Horror',
                    'Music',
                    'Reality-TV',
                    'Sci-Fi',
                    'Short',
                    'Sport',
                    'Talk-Show',
                    'War')
  AND it2.id IN ('4')
  AND mi2.info IN ('Albanian',
                    'Arabic',
                    'Bengali',
                    'Bulgarian',
                    'Chinese',
                    'Czech',
                    'Filipino',
                    'Polish',
                    'Russian',
                    'Slovak',
                    'Swedish',
                    'Swiss German',
                    'Tamil',
                    'Turkish',
                    'Urdu');