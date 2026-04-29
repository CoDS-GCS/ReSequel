
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Mono',
                    'Silent')
  AND mi2.info IN ('Fantasy',
                    'History',
                    'Sci-Fi',
                    'Sport',
                    'Thriller')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('6')
  AND mi2.info_type_id IN ('3')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-novel',
                     'based-on-play',
                     'dancing',
                     'death',
                     'doctor',
                     'family-relationships',
                     'flashback',
                     'hardcore',
                     'interview',
                     'jealousy',
                     'male-frontal-nudity',
                     'male-nudity',
                     'new-york-city',
                     'nudity',
                     'number-in-title',
                     'party',
                     'revenge',
                     'singer',
                     'song'));