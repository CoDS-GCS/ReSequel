
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
        WHERE ROLE IN ('director',
                   'editor',
                   'miscellaneous crew'))) AS ci
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%gee%'
     AND id IN
       (SELECT person_id
        FROM person_info
        WHERE info_type_id IN ('21'))) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'tv movie'))) AS t ON ci.movie_id = t.id
JOIN
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('4')
     AND info IN ('English')) AS mi1 ON ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         n.name;