
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Canada:G',
                    'Finland:K-12',
                    'India:U',
                    'Norway:16',
                    'Sweden:11',
                    'Sweden:Btl',
                    'USA:Passed',
                    'USA:TV-G',
                    'USA:X',
                    'West Germany:18',
                    'West Germany:6')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-off-broadway-play',
                     'bat-the-animal',
                     'boat-chase',
                     'bread-box',
                     'hidden-city',
                     'hurling-the-sport',
                     'illegal-gun-buying',
                     'investigative-reporter',
                     'jekyll',
                     'knock-em-dead',
                     'magical-pants',
                     'panhandling',
                     'precociousness',
                     'prig',
                     'red-faced-monkey',
                     'red-jeep',
                     'reference-to-franklin-d-roosevelt',
                     'russian-folk-tale',
                     'simple-man',
                     'street-prophet',
                     'sunday-mass',
                     'uber-soldat',
                     'wedding-of-main-characters'));