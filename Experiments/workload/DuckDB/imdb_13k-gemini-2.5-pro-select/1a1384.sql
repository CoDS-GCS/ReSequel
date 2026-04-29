WITH filtered_movies AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
   WHERE mi1.info_type_id = '3'
     AND mi1.info IN ('Adventure',
                   'Comedy',
                   'Drama',
                   'Fantasy',
                   'Horror',
                   'Music',
                   'Sci-Fi',
                   'Short')
     AND mi2.info_type_id = '7'
     AND mi2.info IN ('CAM:Panasonic AG-DVX100',
                   'PCS:DV',
                   'PCS:Spherical',
                   'PCS:Super 16',
                   'PFM:35 mm',
                   'RAT:1.33 : 1',
                   'RAT:1.66 : 1',
                   'RAT:1.78 : 1 / (high definition)',
                   'RAT:1.78 : 1',
                   'RAT:2.35 : 1'))
SELECT COUNT(*)
FROM filtered_movies AS fm
JOIN title AS t ON fm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2010
  AND t.production_year > 2000
  AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')
  AND rt.role IN ('composer',
                  'producer')
  AND n.gender IN ('m');