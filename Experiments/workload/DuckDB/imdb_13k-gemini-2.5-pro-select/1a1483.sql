WITH t_mi_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   WHERE t.production_year BETWEEN 1875 + 1 AND 1975
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
     AND mi1.info_type_id = '3'
     AND mi1.info IN ('Biography',
                   'Comedy',
                   'Fantasy',
                   'Short',
                   'Western')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('MET:600 m',
                   'MET:900 m',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.85 : 1'))
SELECT COUNT(*)
FROM t_mi_filtered AS t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('m')
  AND rt.role IN ('editor');