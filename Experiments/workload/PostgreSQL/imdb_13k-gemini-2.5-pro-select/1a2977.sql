
SELECT COUNT(*)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer',
                   'composer',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL)
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Adventure',
                    'Animation',
                    'Comedy',
                    'Fantasy',
                    'Film-Noir',
                    'Music',
                    'Reality-TV',
                    'Short',
                    'Talk-Show',
                    'Thriller',
                    'War',
                    'Western')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('Nigeria:2005',
                    'USA:15 October 2011',
                    'USA:1993',
                    'USA:January 2010',
                    'USA:May 2009');