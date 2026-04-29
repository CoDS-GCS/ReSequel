 
 WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('movie',
                   'video movie')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'editor')),
     filtered_it1 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('7')),
     filtered_it2 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('5'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN filtered_it1 AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN filtered_it2 AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND n.gender IS NULL
  AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:35 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND mi2.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'Brazil:Livre',
                    'France:-12',
                    'France:-16',
                    'Germany:BPjM Restricted',
                    'Netherlands:12',
                    'Norway:15',
                    'Switzerland:14',
                    'UK:12');