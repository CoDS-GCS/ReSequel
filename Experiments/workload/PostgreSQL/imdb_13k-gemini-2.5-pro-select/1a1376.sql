 
 WITH ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f',
                   'm')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('director',
                  'production designer')),
     mi_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
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
                   'RAT:2.35 : 1'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
JOIN mi_filtered AS mi ON t.id = mi.movie_id
WHERE t.production_year BETWEEN 2000 + 1 AND 2010
  AND kt.kind IN ('tv series',
                  'video game');