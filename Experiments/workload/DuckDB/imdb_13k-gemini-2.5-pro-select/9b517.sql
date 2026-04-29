
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM
  (SELECT id,
          movie_id,
          person_id
   FROM cast_info
   WHERE role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('cinematographer',
                   'editor',
                   'writer'))) AS ci
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%wo%'
     AND id IN
       (SELECT person_id
        FROM person_info
        WHERE info_type_id IN ('33'))) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))) AS t ON ci.movie_id = t.id
JOIN
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Black and White')) AS mi1 ON ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         n.name;