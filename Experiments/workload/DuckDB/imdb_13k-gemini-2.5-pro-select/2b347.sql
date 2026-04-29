WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('bare-chested-male',
                     'dancing',
                     'death',
                     'fight',
                     'gay',
                     'hardcore',
                     'interview',
                     'male-frontal-nudity',
                     'sequel',
                     'singer',
                     'surrealism'))
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
  AND it1.id IN ('4')
  AND mi1.info IN ('English',
                    'French',
                    'German',
                    'Japanese',
                    'Spanish')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'OFM:Video',
                    'PCS:Digital Intermediate',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'PFM:D-Cinema',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1',
                    'RAT:16:9 HD')
  AND rt.role IN ('costume designer',
                   'production designer')
  AND n.gender IN ('f',
                    'm');