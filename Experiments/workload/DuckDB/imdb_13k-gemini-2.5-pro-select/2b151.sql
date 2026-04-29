
SELECT COUNT(*)
FROM title AS t,
     movie_info AS mi1,
     movie_info AS mi2,
     cast_info AS ci,
     movie_keyword AS mk
WHERE t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('Animation',
                    'Documentary',
                    'Drama',
                    'Short')
  AND mi2.info IN ('Danish',
                    'French',
                    'German',
                    'Japanese',
                    'Spanish',
                    'Turkish')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('4')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'doctor',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'fight',
                     'hardcore',
                     'jealousy',
                     'marriage',
                     'one-word-title',
                     'revenge',
                     'sex',
                     'singer'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);