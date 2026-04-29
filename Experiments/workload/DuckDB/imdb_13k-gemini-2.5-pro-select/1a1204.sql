WITH t_ci_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE t.production_year BETWEEN 1975 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'video game')
     AND n.gender IN ('f',
                   'm')
     AND rt.role IN ('composer',
                  'production designer'))
SELECT COUNT(*)
FROM t_ci_filtered AS t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Biography',
                   'Comedy',
                   'Crime',
                   'Documentary',
                   'Drama',
                   'Sci-Fi')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('OFM:35 mm',
                   'OFM:Redcode RAW',
                   'PCS:Panavision',
                   'PCS:Spherical',
                   'PCS:Super 35',
                   'PFM:Video');