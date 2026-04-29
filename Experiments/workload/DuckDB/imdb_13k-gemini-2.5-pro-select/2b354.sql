WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blind-king',
                     'colossus',
                     'comradery',
                     'concert-ticket',
                     'conspiracy-of-silence',
                     'death-of-pilot',
                     'dying-in-arms-of-mother',
                     'family-filmmaking',
                     'fear-of-hypnotism',
                     'fluxus',
                     'godwins-law',
                     'handicapped',
                     'kaskaderi',
                     'neat-freak',
                     'poisoned-milk',
                     'reference-to-van-den-budenmayer',
                     'repeated-line',
                     'running-water',
                     'sex-in-a-covered-wagon',
                     'shootout-in-an-embassy',
                     'spindel',
                     'telephone-booth',
                     'video-blog',
                     'water-table'))
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'CAM:Red One Camera',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:35 mm',
                    'OFM:Super 16',
                    'PCS:Digital Intermediate',
                    'PCS:Super 16',
                    'PFM:35 mm',
                    'PFM:Digital',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1 / (high definition)',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('f');