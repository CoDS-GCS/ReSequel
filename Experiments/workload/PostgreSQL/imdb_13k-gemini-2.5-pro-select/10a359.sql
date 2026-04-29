WITH filtered_n AS
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%jacq%')
SELECT fn.name,
       mi1.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN filtered_n AS fn ON ci.person_id = fn.id
WHERE kt.kind IN ('tv series')
  AND rt.role IN ('director',
                   'editor',
                   'producer',
                   'production designer')
  AND it1.id IN ('2')
  AND mi1.info IN ('Color')
GROUP BY fn.name,
         mi1.info;