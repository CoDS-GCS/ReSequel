 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year > 1875
     AND kt.kind IN ('episode',
                  'movie',
                  'tv movie'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Crime',
                   'Drama',
                   'Musical',
                   'Mystery',
                   'Short',
                   'Thriller',
                   'Western')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('MET:300 m',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'RAT:1.37 : 1')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('f');