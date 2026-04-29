WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Canada:G',
                    'Finland:K-12',
                    'India:U',
                    'Norway:16',
                    'Sweden:11',
                    'Sweden:Btl',
                    'USA:Passed',
                    'USA:TV-G',
                    'USA:X',
                    'West Germany:18',
                    'West Germany:6'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('actress')
  AND n.gender IN ('f')
  AND k.keyword IN ('based-on-off-broadway-play',
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
                     'wedding-of-main-characters');