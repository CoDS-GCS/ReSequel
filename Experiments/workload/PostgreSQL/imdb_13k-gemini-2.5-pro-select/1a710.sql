 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 + 1 AND 2015
  AND kt.kind IN ('episode',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adventure',
                   'Comedy',
                   'Crime',
                   'Drama')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Germany:18',
                   'India:U',
                   'Netherlands:6',
                   'Singapore:PG',
                   'USA:Not Rated',
                   'USA:PG',
                   'USA:R')
  AND rt.role IN ('editor',
                  'production designer')
  AND n.gender IN ('f');