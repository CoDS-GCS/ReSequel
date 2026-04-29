
SELECT n.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM (name AS n
      JOIN cast_info AS ci ON n.id = ci.person_id
      JOIN role_type AS rt ON ci.role_id = rt.id)
JOIN (title AS t
      JOIN kind_type AS kt ON t.kind_id = kt.id
      JOIN movie_info AS mi1 ON t.id = mi1.movie_id
      JOIN info_type AS it1 ON mi1.info_type_id = it1.id) ON ci.movie_id = t.id
WHERE n.name ILIKE '%dup%'
  AND rt.role IN ('actress',
                   'composer')
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND mi1.info IN ('Stereo')
  AND it1.id IN ('6')
GROUP BY n.name,
         mi1.info;