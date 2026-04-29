
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
        WHERE ROLE IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew',
                   'producer'))) AS ci
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%al%'
     AND id IN
       (SELECT person_id
        FROM person_info
        WHERE info_type_id IN ('39'))) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv series',
                   'video game'))) AS t ON ci.movie_id = t.id
JOIN
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('2',
                  '4',
                  '8')
     AND info IN ('Austria',
                    'Bulgaria',
                    'Bulgarian',
                    'Catalan',
                    'Estonia',
                    'Galician',
                    'Korean',
                    'Pakistan',
                    'Romania',
                    'Serbian',
                    'Singapore',
                    'Slovakia',
                    'Ukraine')) AS mi1 ON ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         n.name;