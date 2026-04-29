
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Australia:PG',
                    'Canada:PG',
                    'Finland:S',
                    'Sweden:15',
                    'UK:A',
                    'UK:PG',
                    'UK:U',
                    'USA:Approved',
                    'USA:Passed')
  AND it2.id IN ('7')
  AND mi2.info IN ('MET:',
                    'OFM:35 mm',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.37 : 1')
  AND rt.role IN ('director')
  AND n.gender IN ('m');