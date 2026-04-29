 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 1975
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Comedy',
                   'Crime',
                   'Drama',
                   'Romance',
                   'Western')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Australia:G',
                   'Sweden:15',
                   'UK:PG',
                   'UK:U',
                   'USA:Approved',
                   'USA:Passed')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                   'm')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director',
                  'miscellaneous crew');