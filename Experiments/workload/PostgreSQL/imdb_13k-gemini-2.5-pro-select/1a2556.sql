 
 WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('editor',
                   'production designer')
  AND (n.gender IN ('f',
                    'm')
       OR n.gender IS NULL)
  AND it1.id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND it2.id IN ('6')
  AND mi2.info IN ('Mono',
                    'Silent',
                    'Stereo');