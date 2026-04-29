 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 + 1 AND 2015
     AND kt.kind IN ('episode',
                  'movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '3'
     AND info IN ('Action',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Family',
                   'History',
                   'Mystery',
                   'Sci-Fi',
                   'Short',
                   'Thriller')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '7'
     AND info IN ('LAB:FotoKem Laboratory, Burbank (CA), USA',
                   'OFM:35 mm',
                   'OFM:Digital',
                   'OFM:Super 16',
                   'PCS:Spherical',
                   'PFM:D-Cinema',
                   'PFM:Video',
                   'RAT:1.33 : 1',
                   'RAT:1.66 : 1',
                   'RAT:1.78 : 1 / (high definition)',
                   'RAT:1.78 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('actor',
                  'writer')) AS ci ON t.id = ci.movie_id;