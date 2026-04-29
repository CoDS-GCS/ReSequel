
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
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('English',
                    'Italian')
  AND mi2.info IN ('LAB:Technicolor',
                    'PCS:Spherical')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('7')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'bare-breasts',
                     'bare-chested-male',
                     'dancing',
                     'dog',
                     'father-daughter-relationship',
                     'female-nudity',
                     'love',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'number-in-title',
                     'one-word-title',
                     'revenge',
                     'singer',
                     'tv-mini-series',
                     'violence'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);