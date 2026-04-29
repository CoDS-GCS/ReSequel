
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
  AND mi1.info IN ('English',
                    'German',
                    'Spanish',
                    'Tagalog')
  AND mi2.info IN ('Argentina:18',
                    'Finland:S',
                    'Germany:18',
                    'Philippines:R-18',
                    'Singapore:PG13',
                    'Spain:18',
                    'Sweden:7',
                    'Switzerland:16',
                    'USA:R')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('5')
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('art-commission',
                     'bag-of-sugar',
                     'born-again',
                     'columbus-circle-manhattan-new-york-city',
                     'evolution',
                     'failed-kidnapping',
                     'fake-chemistry',
                     'gay-actor',
                     'hvx',
                     'killed-in-explosion',
                     'loss-of-grandfather',
                     'motorsport',
                     'nuclear-scientist',
                     'pinned-under-a-car',
                     'plow-horse',
                     'reference-to-reinhard-heydrich',
                     'returned-mail',
                     'san-francisco-bay-bridge',
                     'smoky-mountain-wrestling',
                     'vanilla-slice',
                     'video-clip',
                     'wedding-reception'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);