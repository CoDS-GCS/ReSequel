
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
        WHERE ROLE IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer'))) AS ci
JOIN
  (SELECT id,
          name
   FROM name
   WHERE name ILIKE '%sy%'
     AND id IN
       (SELECT person_id
        FROM person_info
        WHERE info_type_id IN ('22'))) AS n ON ci.person_id = n.id
JOIN
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
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
   WHERE info_type_id IN ('105',
                  '107',
                  '110')
     AND info IN ('$1,500,000',
                    '$12,000,000',
                    '$15,000',
                    '$2,000',
                    '$200,000',
                    '$25,000',
                    '$250,000',
                    '$3,000',
                    '$30,000',
                    '$300,000',
                    '$35,000,000',
                    '$40,000,000',
                    '$500',
                    '$8,000,000')) AS mi1 ON ci.movie_id = mi1.movie_id
GROUP BY mi1.info,
         n.name;