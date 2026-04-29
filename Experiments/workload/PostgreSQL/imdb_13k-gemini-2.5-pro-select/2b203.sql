
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
  AND mi1.info IN ('Color')
  AND mi2.info IN ('$300,000',
                    '$35,000',
                    '$5,000,000')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'video movie'))
  AND mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('105')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'based-on-novel',
                     'based-on-play',
                     'father-son-relationship',
                     'female-frontal-nudity',
                     'female-nudity',
                     'hardcore',
                     'independent-film',
                     'jealousy',
                     'lesbian',
                     'love',
                     'marriage',
                     'mother-son-relationship',
                     'police',
                     'revenge',
                     'sequel',
                     'violence'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);