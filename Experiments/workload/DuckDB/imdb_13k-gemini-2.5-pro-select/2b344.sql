
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Crime',
                    'Drama',
                    'Romance',
                    'Thriller')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:M',
                    'Australia:R',
                    'Belgium:KT',
                    'Finland:K-15',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:L',
                    'Singapore:M18',
                    'Singapore:PG',
                    'Sweden:15',
                    'UK:15',
                    'UK:U',
                    'USA:R')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'based-on-play',
                     'dog',
                     'female-nudity',
                     'gay',
                     'lesbian',
                     'love',
                     'male-nudity',
                     'mother-son-relationship',
                     'number-in-title',
                     'party',
                     'police',
                     'singer'));