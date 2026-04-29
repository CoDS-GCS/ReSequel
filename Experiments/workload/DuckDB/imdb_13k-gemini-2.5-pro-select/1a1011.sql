WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1975
     AND t.production_year > 1875
     AND kt.kind IN ('tv series',
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
                   'Drama',
                   'History',
                   'Horror',
                   'Mystery',
                   'Sci-Fi',
                   'Short')
  AND mi2.info_type_id = '7'
  AND mi2.info IN ('MET:1500 m',
                   'MET:200 m',
                   'MET:23 m',
                   'MET:300 m',
                   'OFM:35 mm',
                   'PCS:Spherical',
                   'PFM:16 mm',
                   'RAT:1.20 : 1',
                   'RAT:1.33 : 1',
                   'RAT:1.37 : 1',
                   'RAT:1.85 : 1',
                   'RAT:2.35 : 1')
  AND rt.role IN ('editor')
  AND n.gender IN ('f');