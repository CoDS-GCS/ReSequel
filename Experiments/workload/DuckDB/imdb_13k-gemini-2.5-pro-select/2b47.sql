
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('arson-specialist',
                     'asked-to-the-prom',
                     'courbevoie-france',
                     'golden-anniversary',
                     'hired-to-steal',
                     'homeowner-association',
                     'housemate',
                     'inconvenient-person',
                     'leica-camera',
                     'manzanita',
                     'menstrual-cycle',
                     'over-the-hill',
                     'reason',
                     'reference-to-the-new-york-observer',
                     'sari',
                     'satyriasis',
                     'schlager',
                     'shot-in-the-temple',
                     'street-kids',
                     'street-show',
                     'torcy-france')) AS filtered_mk
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
                   'movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:R',
                    'Brazil:16',
                    'Finland:S',
                    'Germany:16',
                    'Iceland:12',
                    'Netherlands:16',
                    'New Zealand:R18',
                    'Portugal:M/16',
                    'Spain:T',
                    'UK:PG',
                    'USA:Unrated',
                    'USA:X')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'PCS:Digital Intermediate',
                    'PCS:Spherical',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND rt.role IN ('actress',
                   'production designer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);