WITH t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   AND it1.id IN ('4')
   AND mi1.info IN ('English',
                    'Hungarian',
                    'Italian',
                    'Japanese',
                    'Russian',
                    'Swedish')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   JOIN info_type AS it2 ON mi2.info_type_id = it2.id
   AND it2.id IN ('7')
   AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                    'OFM:16 mm',
                    'OFM:35 mm',
                    'PCS:Panavision',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:1.37 : 1',
                    'RAT:1.66 : 1',
                    'RAT:2.35 : 1')
   JOIN kind_type AS kt ON t.kind_id = kt.id
   AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
   WHERE t.production_year BETWEEN 1875 AND 1975)
SELECT COUNT(*)
FROM t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor')
JOIN movie_keyword AS mk ON t_mi.id = mk.movie_id;