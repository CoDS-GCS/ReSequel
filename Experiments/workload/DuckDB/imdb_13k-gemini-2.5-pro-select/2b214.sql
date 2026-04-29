
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('bell-uh-1-iroquois-helicopter',
                     'bridge',
                     'elinor-glyn',
                     'liquor-flask',
                     'martial-arts-tournament',
                     'mistaken-for-a-terrorist',
                     'movie-institute',
                     'power-cosmic',
                     'reference-to-prince-henry-of-portugal',
                     'rock-placed-on-car-gas-pedal',
                     'security-system',
                     'year-1750')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('7')
  AND mi1.info IN ('CAM:Red One Camera',
                    'LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'OFM:35 mm',
                    'OFM:Digital',
                    'OFM:Redcode RAW',
                    'PCS:Digital Intermediate',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'PFM:D-Cinema',
                    'PFM:Video',
                    'RAT:1.33 : 1',
                    'RAT:2.35 : 1')
  AND it2.id IN ('3')
  AND mi2.info IN ('Adult',
                    'Adventure',
                    'Comedy',
                    'Drama',
                    'Family',
                    'Short',
                    'War')
  AND rt.role IN ('costume designer',
                   'production designer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);