
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
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Horror',
                    'Romance',
                    'Short')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Buenos Aires, Federal District, Argentina',
                    'Hollywood, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Mexico',
                    'New York City, New York, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'blood',
                     'death',
                     'doctor',
                     'flashback',
                     'homosexual',
                     'lesbian',
                     'love',
                     'male-frontal-nudity',
                     'marriage',
                     'party',
                     'police',
                     'singing',
                     'song',
                     'suicide'));