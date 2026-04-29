WITH filtered_n AS
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%klau%'),
     filtered_mi AS
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('2')
     AND info IN ('Black and White'))
SELECT fn.name,
       fmi.info,
       MIN(t.production_year),
       MAX(t.production_year)
FROM title AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS fn ON ci.person_id = fn.id
JOIN filtered_mi AS fmi ON t.id = fmi.movie_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer'))
GROUP BY fn.name,
         fmi.info;