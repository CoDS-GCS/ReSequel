 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series',
                  'video game')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '8'
     AND info IN ('Brazil',
                   'Canada',
                   'Denmark',
                   'Egypt',
                   'Germany',
                   'Hong Kong',
                   'Portugal',
                   'Romania',
                   'Russia',
                   'South Korea',
                   'Soviet Union',
                   'Spain',
                   'Sweden',
                   'UK')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '4'
     AND info IN ('Arabic',
                   'Cantonese',
                   'Danish',
                   'English',
                   'German',
                   'Korean',
                   'Portuguese',
                   'Romanian',
                   'Russian',
                   'Swedish')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('costume designer')) AS ci ON t.id = ci.movie_id;