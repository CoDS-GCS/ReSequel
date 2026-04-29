
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Stereo')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'Bulgaria',
                    'Canada',
                    'France',
                    'Hong Kong',
                    'India')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('7th-century-b.c.',
                     'company-party',
                     'corset',
                     'cyber-attack',
                     'french-polynesia',
                     'gold-mining',
                     'jumping-off-the-top-of-a-train-car',
                     'music-business',
                     'pan-sonic',
                     'personal-vision',
                     'reference-to-zachary-scott',
                     'singing-telegram',
                     'songwriter',
                     'videobob'));