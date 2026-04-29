
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
                   'miscellaneous crew'))) AS ci
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%su%'
     AND id IN
       (SELECT person_id
        FROM person_info
        WHERE info_type_id IN ('26'))) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'video movie'))) AS t ON ci.movie_id = t.id
JOIN
  (SELECT movie_id,
          info
   FROM movie_info
   WHERE info_type_id IN ('3',
                  '5',
                  '6')
     AND info IN ('Adventure',
                    'Argentina:13',
                    'Argentina:16',
                    'Australia:G',
                    'Finland:S',
                    'Horror',
                    'Mono',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Sci-Fi',
                    'Sport',
                    'Thriller',
                    'UK:A',
                    'UK:PG',
                    'USA:G',
                    'USA:TV-G',
                    'West Germany:12',
                    'West Germany:6',
                    'Western')) AS mi1 ON ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         n.name;