 
 
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 1975
     AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '8'
     AND info IN ('Brazil',
                   'Denmark',
                   'France',
                   'South Korea',
                   'Soviet Union',
                   'Sweden',
                   'Turkey',
                   'USA',
                   'Yugoslavia')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id = '4'
     AND info IN ('Danish',
                   'English',
                   'French',
                   'Korean',
                   'Portuguese',
                   'Russian',
                   'Serbo-Croatian',
                   'Swedish',
                   'Turkish')) AS mi2 ON t.id = mi2.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IN ('m')
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('director')) AS ci ON t.id = ci.movie_id;