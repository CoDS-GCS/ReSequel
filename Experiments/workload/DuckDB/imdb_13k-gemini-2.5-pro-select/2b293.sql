
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
     WHERE kind IN ('movie',
                   'video movie'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Animation',
                    'Biography',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Musical',
                    'Short')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('Danish',
                    'French',
                    'German',
                    'Hindi',
                    'Japanese',
                    'Norwegian',
                    'Romanian',
                    'Russian',
                    'Spanish')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'dog',
                     'flashback',
                     'jealousy',
                     'lesbian',
                     'lesbian-sex',
                     'love',
                     'male-frontal-nudity',
                     'mother-son-relationship',
                     'number-in-title',
                     'one-word-title',
                     'police',
                     'revenge',
                     'sequel',
                     'song',
                     'suicide'));