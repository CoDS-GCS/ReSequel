
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
        WHERE ROLE IN ('editor',
                   'production designer'))) AS ci
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%andre%'
     AND id IN
       (SELECT person_id
        FROM person_info
        WHERE info_type_id IN ('26'))) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))) AS t ON ci.movie_id = t.id
JOIN
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('3',
                  '4',
                  '8')
     AND info IN ('Adult',
                    'Animation',
                    'Argentina',
                    'Danish',
                    'Denmark',
                    'Georgia',
                    'Georgian',
                    'Mexico',
                    'Norway',
                    'Romanian',
                    'Slovak',
                    'South Africa',
                    'Switzerland',
                    'Tagalog')) AS mi1 ON ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         n.name;