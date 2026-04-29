 
 WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Crime',
                   'Documentary',
                   'Drama',
                   'Fantasy',
                   'Short',
                   'Sport',
                   'Western')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('MET:15.2 m',
                   'MET:15.24 m',
                   'MET:150 m',
                   'MET:1500 m',
                   'MET:600 m',
                   'MET:900 m',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'PFM:35 mm',
                   'PFM:68 mm',
                   'RAT:1.33 : 1'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 1925
  AND t.production_year > 1875
  AND kt.kind IN ('movie')
  AND rt.role IN ('editor')
  AND n.gender IN ('f');