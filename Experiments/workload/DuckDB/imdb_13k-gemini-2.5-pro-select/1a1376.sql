WITH t_ci_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE t.production_year BETWEEN 2000 + 1 AND 2010
     AND kt.kind IN ('tv series',
                  'video game')
     AND n.gender IN ('f',
                   'm')
     AND rt.role IN ('director',
                  'production designer'))
SELECT COUNT(*)
FROM t_ci_filtered AS t_ci
JOIN movie_info AS mi1 ON t_ci.id = mi1.movie_id
JOIN movie_info AS mi2 ON t_ci.id = mi2.movie_id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Animation',
                   'Comedy',
                   'Drama',
                   'Fantasy',
                   'Horror',
                   'Music',
                   'Sci-Fi')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('CAM:Panavision Cameras and Lenses',
                   'OFM:35 mm',
                   'OFM:Digital',
                   'RAT:1.33 : 1',
                   'RAT:1.78 : 1 / (high definition)',
                   'RAT:1.78 : 1',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1');