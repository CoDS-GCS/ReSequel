WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bloodlust',
                     'bomb-shelter',
                     'burnouts',
                     'buzz-aldrin',
                     'career-choice',
                     'ceiling-mirror',
                     'dutch-cinema',
                     'fifty-first-state',
                     'françois-villon',
                     'holiday-horror',
                     'indian-army',
                     'laguardia-airport-queens-new-york-city',
                     'modesty',
                     'nude-in-a-window',
                     'outing',
                     'reference-to-blaise-pascal',
                     'religious-film',
                     'scale-model-house',
                     'stock-cube',
                     'tupolev-tu-2-bomber'))
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
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:R',
                    'Brazil:12',
                    'Canada:13+',
                    'Canada:18A',
                    'Chile:TE',
                    'Finland:K-15',
                    'Germany:6',
                    'Iceland:16',
                    'Ireland:15A',
                    'Portugal:M/16',
                    'South Korea:All',
                    'USA:Approved',
                    'USA:PG-13')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'OFM:35 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND rt.role IN ('cinematographer',
                   'composer')
  AND n.gender IN ('f',
                    'm');