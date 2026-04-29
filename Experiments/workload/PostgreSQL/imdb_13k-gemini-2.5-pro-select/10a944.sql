WITH relevant_movies AS
  (SELECT t.id AS movie_id,
          t.production_year,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE kt.kind IN ('episode',
                   'movie',
                   'tv movie')
     AND mi1.info IN ('Belgium')
     AND it1.id IN ('8'))
SELECT n.name,
       rm.info,
       MIN(rm.production_year),
       MAX(rm.production_year)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN relevant_movies AS rm ON ci.movie_id = rm.movie_id
WHERE n.name ILIKE '%rogier%'
  AND rt.role IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
GROUP BY n.name,
         rm.info;