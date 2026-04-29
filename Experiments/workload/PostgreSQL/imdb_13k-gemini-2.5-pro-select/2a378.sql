 
 WITH t_ci AS
  (SELECT t.id
   FROM title AS t
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                    'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('composer',
                   'production designer')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
   WHERE t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('8')
AND mi1.info IN ('Australia',
                    'Czechoslovakia',
                    'France',
                    'Hong Kong',
                    'USA',
                    'Yugoslavia')
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('7')
AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                    'OFM:35 mm',
                    'PCS:Shawscope',
                    'PFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.37 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3')
JOIN movie_keyword AS mk ON t_ci.id = mk.movie_id;