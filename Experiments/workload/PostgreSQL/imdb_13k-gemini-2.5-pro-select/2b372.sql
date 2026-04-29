
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('CAM:Arriflex Cameras and Lenses',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'LAB:Technicolor, USA',
                    'OFM:HDCAM',
                    'OFM:Live',
                    'PCS:DV',
                    'PCS:DVCAM',
                    'PCS:Kinescope',
                    'PCS:Redcode RAW',
                    'PCS:Shawscope',
                    'PFM:DVD-ROM',
                    'PFM:Digital',
                    'RAT:16:9 HD',
                    'RAT:2.20 : 1')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'video movie'))
  AND mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('7')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'bare-chested-male',
                     'based-on-play',
                     'blood',
                     'fight',
                     'friendship',
                     'gay',
                     'independent-film',
                     'kidnapping',
                     'mother-son-relationship',
                     'murder',
                     'new-york-city',
                     'non-fiction',
                     'nudity',
                     'sequel',
                     'sex',
                     'singer'));