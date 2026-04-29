
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
  AND mi1.info IN ('English',
                    'French',
                    'German')
  AND mi2.info IN ('LAB:Technicolor',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Digital',
                    'PFM:16 mm',
                    'PFM:Video',
                    'RAT:1.85 : 1')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('7')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('anal-sex',
                     'bare-breasts',
                     'based-on-novel',
                     'based-on-play',
                     'dancing',
                     'dog',
                     'female-nudity',
                     'flashback',
                     'gun',
                     'homosexual',
                     'lesbian',
                     'lesbian-sex',
                     'murder',
                     'party',
                     'sex',
                     'song',
                     'tv-mini-series',
                     'violence'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'editor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);