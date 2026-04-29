
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('7')
AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:35 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('5')
AND mi2.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'Brazil:Livre',
                    'France:-12',
                    'France:-16',
                    'Germany:BPjM Restricted',
                    'Netherlands:12',
                    'Norway:15',
                    'Switzerland:14',
                    'UK:12')
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND n.gender IS NULL
  AND rt.role IN ('cinematographer',
                   'editor');