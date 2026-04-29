 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Comedy',
                   'Documentary',
                   'Drama',
                   'History',
                   'Short',
                   'Sport')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('MET:15.24 m',
                   'MET:1500 m',
                   'PCS:Spherical',
                   'RAT:1.20 : 1',
                   'RAT:1.33 : 1',
                   'RAT:1.36 : 1',
                   'RAT:1.37 : 1')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('editor'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1875 + 1 AND 1975
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie');