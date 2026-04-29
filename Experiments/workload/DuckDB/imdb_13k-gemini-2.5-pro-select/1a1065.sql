WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year > 1990
     AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Animation',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Fantasy',
                   'Horror',
                   'Music',
                   'Sci-Fi',
                   'Short',
                   'Thriller')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Red One Camera',
                   'LAB:DeLuxe, Hollywood (CA), USA',
                   'OFM:16 mm',
                   'OFM:Super 16',
                   'PCS:Spherical',
                   'PCS:Super 35',
                   'PFM:35 mm',
                   'PFM:D-Cinema',
                   'PFM:Video',
                   'RAT:1.33 : 1',
                   'RAT:1.66 : 1',
                   'RAT:1.78 : 1',
                   'RAT:1.85 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1')
  AND rt.role IN ('producer')
  AND n.gender IN ('f');