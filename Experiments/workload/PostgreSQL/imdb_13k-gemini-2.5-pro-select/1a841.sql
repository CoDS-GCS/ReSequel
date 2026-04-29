 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                  'tv series')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = '3'
AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Documentary',
                   'Drama',
                   'Romance',
                   'Short',
                   'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id = '5'
AND mi2.info IN ('Argentina:13',
                   'Australia:M',
                   'Germany:12',
                   'Hong Kong:IIB',
                   'India:U',
                   'Netherlands:12',
                   'Netherlands:16',
                   'Singapore:M18',
                   'South Korea:15',
                   'UK:PG',
                   'USA:Not Rated',
                   'USA:PG-13')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('costume designer')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
WHERE t.production_year <= 2015
  AND t.production_year > 1975;