
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN cast_info AS ci ON mi1.movie_id = ci.movie_id
JOIN title AS t ON mi1.movie_id = t.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND it1.id IN ('2')
  AND it2.id IN ('7')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info IN ('LAB:Technicolor, USA',
                    'MET:200 m',
                    'MET:23 m',
                    'MET:900 m',
                    'OFM:16 mm',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Panavision',
                    'PFM:68 mm',
                    'RAT:1.36 : 1',
                    'RAT:1.66 : 1',
                    'RAT:1.85 : 1',
                    'RAT:2.35 : 1')
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('production designer')
  AND n.gender IS NULL;