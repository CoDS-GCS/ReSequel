 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year <= 1997
     AND t.production_year > 1981
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id = '3'
  AND mi1.info IN ('Biography',
                   'Drama',
                   'Fantasy',
                   'History',
                   'Musical',
                   'News',
                   'Short',
                   'Sport',
                   'War')
  AND mi2.info_type_id = '2'
  AND mi2.info IN ('Black and White',
                   'Color')
  AND rt.role IN ('composer')
  AND n.gender IN ('f');