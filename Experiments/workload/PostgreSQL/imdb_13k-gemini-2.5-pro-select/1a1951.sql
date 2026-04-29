 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '8'
     AND info IN ('France',
                   'Hong Kong',
                   'Nigeria',
                   'Sweden',
                   'Switzerland',
                   'UK')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '4'
     AND info IN ('English',
                   'French',
                   'German',
                   'Italian',
                   'Mandarin',
                   'Spanish',
                   'Yoruba')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('f')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('actress')) AS ci ON t.id = ci.movie_id;