WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('death',
                     'father-son-relationship',
                     'fight',
                     'gay',
                     'independent-film',
                     'lesbian-sex',
                     'mother-daughter-relationship',
                     'murder',
                     'number-in-title'))
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3')
  AND it2.id IN ('8')
  AND mi2.info IN ('East Germany',
                    'Hong Kong',
                    'Italy',
                    'Taiwan',
                    'UK',
                    'USA',
                    'West Germany')
  AND rt.role IN ('production designer')
  AND n.gender IN ('f');