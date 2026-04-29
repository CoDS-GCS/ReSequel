 
 WITH mi1_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Animation',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Music',
                   'Western')),
     mi2_filtered AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                   'LAB:Technicolor',
                   'OFM:35 mm',
                   'PCS:Panavision',
                   'PCS:Spherical',
                   'PFM:16 mm',
                   'RAT:1.66 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('actor',
                  'composer'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered AS mi2 ON t.id = mi2.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
WHERE t.production_year BETWEEN 1975 + 1 AND 2015
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie');