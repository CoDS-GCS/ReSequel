WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('abducted-child',
                     'adult-film-industry',
                     'body-check',
                     'building-contractor',
                     'computer-generated',
                     'death-of-expectant-mother',
                     'face-shield',
                     'handsome-stranger',
                     'invisible-enemy',
                     'milly-la-forêt-france',
                     'multiverse',
                     'murder-of-stepdaughter',
                     'oratorio',
                     'radio-advertisement',
                     'reference-to-gina-lollobrigida',
                     'reference-to-oprah',
                     'rim-shot',
                     'suicide-by-strangulation',
                     'westward-trek',
                     'wood-shop',
                     'zebra-suit'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('10',
                    '100',
                    '20',
                    '25',
                    '30',
                    '70',
                    '80',
                    '85',
                    '88',
                    '90',
                    'USA:50',
                    'USA:60')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('producer')
  AND n.gender IN ('m');