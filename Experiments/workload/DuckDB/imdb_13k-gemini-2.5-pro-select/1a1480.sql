WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 2015
     AND t.production_year > 1975
     AND kt.kind IN ('episode',
                  'movie',
                  'video movie'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Animation',
                   'Documentary',
                   'Drama',
                   'Family',
                   'Fantasy',
                   'Music',
                   'Western')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('LAB:Consolidated Film Industries (CFI), Hollywood (CA), USA',
                   'LAB:Technicolor',
                   'OFM:35 mm',
                   'PCS:Panavision',
                   'PCS:Spherical',
                   'PFM:16 mm',
                   'RAT:1.66 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1')
  AND rt.role IN ('actor',
                  'composer')
  AND n.gender IN ('m');