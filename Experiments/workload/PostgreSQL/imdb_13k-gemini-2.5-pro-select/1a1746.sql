 
 WITH t_mi_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   WHERE t.production_year BETWEEN 1975 + 1 AND 2015
     AND kt.kind IN ('tv movie')
     AND mi1.info_type_id = '8'
     AND mi1.info IN ('Belgium',
                   'Czech Republic',
                   'France',
                   'Germany',
                   'India',
                   'Israel',
                   'Netherlands',
                   'Nigeria',
                   'Poland',
                   'South Korea',
                   'Spain',
                   'UK',
                   'West Germany')
     AND mi2.info_type_id = '4'
     AND mi2.info IN ('Czech',
                   'Dutch',
                   'English',
                   'German',
                   'Hebrew',
                   'Korean',
                   'Polish'))
SELECT COUNT(*)
FROM t_mi_filtered AS t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('f')
  AND rt.role IN ('cinematographer',
                  'costume designer');