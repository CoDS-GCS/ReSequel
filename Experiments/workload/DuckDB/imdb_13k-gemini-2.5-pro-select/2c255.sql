WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#3.15)',
                   'Caesars Wife',
                   'Dixie',
                   'Gold Fever',
                   'Golden Boy',
                   'Jealousy',
                   'Maridinho de Luxo',
                   'Million Dollar Mermaid',
                   'Revenge',
                   'Running Wild',
                   'Santa',
                   'Start Cheering',
                   'The Alibi',
                   'The Battle of the River Plate',
                   'The Lone Ranger Rides Again',
                   'Trial by Fire',
                   'Under Suspicion')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv series'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('f',
                    'm')
  AND rt.role IN ('actor',
                   'actress',
                   'costume designer',
                   'editor',
                   'writer')
  AND it1.id IN ('6')
  AND mi1.info IN ('4-Track Stereo',
                    '70 mm 6-Track',
                    'AGA Sound System',
                    'Stereo',
                    'Vitaphone')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'LAB:DeLuxe',
                    'LAB:Technicolor',
                    'LAB:Technicolor, USA',
                    'OFM:16 mm',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'PFM:Video',
                    'RAT:1.20 : 1',
                    'RAT:1.33 : 1',
                    'RAT:1.66 : 1');