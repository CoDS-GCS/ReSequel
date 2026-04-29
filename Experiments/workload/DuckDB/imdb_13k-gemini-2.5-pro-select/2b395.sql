
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Crime',
                    'Documentary',
                    'Drama',
                    'Romance',
                    'Short',
                    'Thriller')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Madrid, Spain',
                    'New York City, New York, USA',
                    'New York, USA',
                    'Toronto, Ontario, Canada',
                    'Vancouver, British Columbia, Canada',
                    'Washington, District of Columbia, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'doctor',
                     'family-relationships',
                     'father-son-relationship',
                     'female-nudity',
                     'friendship',
                     'kidnapping',
                     'number-in-title',
                     'police',
                     'suicide'));