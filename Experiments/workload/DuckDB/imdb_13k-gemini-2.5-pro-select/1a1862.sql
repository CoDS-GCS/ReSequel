WITH t_mi_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   WHERE t.production_year BETWEEN 1990 + 1 AND 2015
     AND kt.kind IN ('video game')
     AND mi1.info_type_id = '8'
     AND mi1.info IN ('Belgium',
                   'Colombia',
                   'Czech Republic',
                   'Denmark',
                   'Germany',
                   'Nigeria',
                   'Philippines',
                   'Sweden',
                   'USA')
     AND mi2.info_type_id = '4'
     AND mi2.info IN ('English',
                   'French',
                   'Japanese',
                   'Spanish',
                   'Yoruba'))
SELECT COUNT(*)
FROM t_mi_filtered AS t_mi
JOIN cast_info AS ci ON t_mi.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('f')
  AND rt.role IN ('editor');