
SELECT n.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
WHERE n.name ILIKE '%such%'
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer')
  AND mi1.info IN ('Japanese')
  AND mi1.info_type_id IN ('4')
  AND kt.kind IN ('tv series')
GROUP BY n.name,
         mi1.info;