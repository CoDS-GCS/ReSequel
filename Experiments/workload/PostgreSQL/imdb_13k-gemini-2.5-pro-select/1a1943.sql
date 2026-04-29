 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year <= 2015
  AND t.production_year > 1990
  AND kt.kind IN ('episode')
  AND mi1.info_type_id = '8'
  AND mi1.info IN ('Australia',
                   'Greece',
                   'Nigeria',
                   'Philippines',
                   'Poland',
                   'Portugal',
                   'UK',
                   'USA')
  AND mi2.info_type_id = '4'
  AND mi2.info IN ('English',
                   'Greek',
                   'Polish',
                   'Portuguese',
                   'Spanish',
                   'Tagalog')
  AND rt.role IN ('editor')
  AND n.gender IN ('m');