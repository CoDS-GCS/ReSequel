WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Action',
                   'Adventure',
                   'Biography',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Horror',
                   'Musical',
                   'Romance',
                   'Sci-Fi',
                   'Short')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('CAM:Red One Camera',
                   'OFM:16 mm',
                   'OFM:35 mm',
                   'PFM:35 mm',
                   'RAT:1.37 : 1',
                   'RAT:1.78 : 1 / (high definition)',
                   'RAT:1.78 : 1',
                   'RAT:1.85 : 1',
                   'RAT:16:9 HD',
                   'RAT:2.35 : 1'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND rt.role IN ('composer')
  AND n.gender IN ('m');