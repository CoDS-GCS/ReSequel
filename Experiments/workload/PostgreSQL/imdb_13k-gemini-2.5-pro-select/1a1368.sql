 
 WITH filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('cinematographer'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
WHERE t.production_year <= 1925
  AND t.production_year > 1910
  AND kt.kind IN ('movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Adventure',
                   'Animation',
                   'Documentary',
                   'Drama',
                   'Western')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('MET:150 m',
                   'MET:1500 m',
                   'MET:300 m',
                   'PFM:35 mm',
                   'RAT:1.33 : 1');