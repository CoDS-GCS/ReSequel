WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     filtered_mi1 AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color')),
     filtered_mi2 AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   JOIN info_type AS it ON mi.info_type_id = it.id
   WHERE it.id IN ('7')
     AND mi.info IN ('CAM:Canon 7D',
                    'CAM:Sony HDW-F900',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'OFM:Digital',
                    'OFM:Redcode RAW',
                    'PCS:HDCAM',
                    'PCS:Spherical',
                    'PFM:35 mm',
                    'RAT:2.35 : 1',
                    'RAT:4:3')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND rt.role IN ('actor',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN filtered_mi1 AS mi1 ON t.id = mi1.movie_id
JOIN filtered_mi2 AS mi2 ON t.id = mi2.movie_id;