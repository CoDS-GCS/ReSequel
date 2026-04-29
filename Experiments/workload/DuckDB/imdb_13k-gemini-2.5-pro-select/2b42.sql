
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'China',
                    'Germany',
                    'India',
                    'Italy',
                    'Mexico',
                    'Netherlands',
                    'Portugal',
                    'Switzerland',
                    'West Germany')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('doctor',
                     'dog',
                     'father-son-relationship',
                     'hardcore',
                     'independent-film',
                     'lesbian-sex',
                     'male-nudity',
                     'mother-son-relationship',
                     'oral-sex',
                     'police',
                     'singing'));