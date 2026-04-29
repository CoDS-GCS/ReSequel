
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
  AND mi1.info IN ('42',
                    '90')
  AND mi2.info IN ('English')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('1')
  AND mi2.info_type_id IN ('4')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bondage-gear',
                     'bouchavesnes-france',
                     'cleaning-fluid',
                     'end-of-an-era',
                     'falling-off-a-porch-step',
                     'flippy',
                     'friendship-between-women',
                     'gate-of-bobo',
                     'high-school-friends',
                     'hungry-hungry-hippos',
                     'kimberly-australia',
                     'knife-held-to-ones-throat',
                     'lecture-tour',
                     'make-love-not-war',
                     'male-rivalry',
                     'preserved-severed-head',
                     'reference-to-dreyfus-case',
                     'reference-to-henry-viii',
                     'vibration',
                     'wanderer',
                     'whipping-scars'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'miscellaneous crew'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f')
       OR gender IS NULL);