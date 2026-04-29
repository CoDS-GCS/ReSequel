 
 WITH filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND rt.role IN ('producer',
                  'writer'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
WHERE t.production_year <= 2015
  AND t.production_year > 1975
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND mi1.info_type_id = '3'
  AND mi1.info IN ('Action',
                   'Adult',
                   'Adventure',
                   'Crime')
  AND mi2.info_type_id = '5'
  AND mi2.info IN ('Germany:12',
                   'Germany:18',
                   'Hong Kong:IIB',
                   'Netherlands:16',
                   'USA:R');