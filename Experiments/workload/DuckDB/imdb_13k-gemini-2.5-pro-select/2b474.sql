
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
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('USA:2004',
                    'USA:2011')
  AND mi2.info IN ('English')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game'))
  AND mi1.info_type_id IN ('16')
  AND mi2.info_type_id IN ('4')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'based-on-novel',
                     'blood',
                     'character-name-in-title',
                     'death',
                     'family-relationships',
                     'female-frontal-nudity',
                     'friendship',
                     'gay',
                     'hardcore',
                     'interview',
                     'jealousy',
                     'lesbian-sex',
                     'marriage',
                     'oral-sex',
                     'revenge',
                     'sequel',
                     'tv-mini-series'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('miscellaneous crew',
                   'producer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);