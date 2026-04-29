WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 + 1 AND 1990
     AND kt.kind IN ('tv series',
                  'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Comedy',
                   'Drama',
                   'Family',
                   'Horror',
                   'Thriller',
                   'Western')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:13',
                   'Argentina:16',
                   'Argentina:Atp',
                   'Australia:G',
                   'Belgium:KT',
                   'Iceland:16',
                   'Singapore:PG',
                   'Sweden:11',
                   'UK:15',
                   'UK:U',
                   'USA:Approved',
                   'West Germany:16')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('miscellaneous crew',
                  'producer');