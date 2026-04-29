
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1925
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Comedy',
                   'Family',
                   'History',
                   'Romance')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('Hindi',
                   'Italian',
                   'Japanese',
                   'Polish',
                   'Spanish')
  AND rt.role IN ('director')
  AND n.gender IN ('f');