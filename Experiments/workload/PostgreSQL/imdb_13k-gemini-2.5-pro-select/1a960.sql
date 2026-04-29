 
 WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 + 1 AND 2015
     AND kt.kind IN ('tv movie',
                  'tv series'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Drama',
                   'Horror',
                   'Mystery',
                   'Romance',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:13',
                   'Australia:M',
                   'Canada:G',
                   'Finland:K-15',
                   'Finland:K-16',
                   'Hong Kong:IIB',
                   'Iceland:16',
                   'Netherlands:12',
                   'Singapore:NC-16',
                   'South Korea:12',
                   'Sweden:11',
                   'UK:A',
                   'UK:PG',
                   'USA:Approved')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('editor');