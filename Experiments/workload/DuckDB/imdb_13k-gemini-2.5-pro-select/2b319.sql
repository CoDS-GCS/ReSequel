WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('7')
     AND mi.info IN ('OFM:Live',
                    'OFM:Video',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.33 : 1')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('25',
                    '30',
                    '60',
                    '87',
                    '90',
                    '91',
                    '94',
                    '98'))
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('actor',
                   'miscellaneous crew')
  AND n.gender IN ('m')
  AND k.keyword IN ('cigarette-smoking',
                     'death',
                     'doctor',
                     'gay',
                     'gun',
                     'hardcore',
                     'hospital',
                     'lesbian-sex',
                     'mother-son-relationship',
                     'police',
                     'suicide');