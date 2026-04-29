WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('creative-internet-radio',
                     'dapitan',
                     'facial-deformity',
                     'father-and-son-compete-for-woman',
                     'lizard-creature',
                     'seamstress',
                     'year-991'))
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
                   'tv movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('LAB:DeLuxe',
                    'MET:150 m',
                    'MET:300 m',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1')
  AND it2.id IN ('6')
  AND mi2.info IN ('Mono',
                    'Silent')
  AND rt.role IN ('director')
  AND n.gender IN ('m');