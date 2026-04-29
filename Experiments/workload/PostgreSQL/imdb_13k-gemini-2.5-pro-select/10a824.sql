WITH relevant_cast AS
  (SELECT n.name,
          ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.name ILIKE '%carmi%'
     AND rt.role IN ('director',
                   'miscellaneous crew',
                   'producer',
                   'production designer')),
     relevant_movies AS
  (SELECT t.id AS movie_id,
          t.production_year,
          mi.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi ON t.id = mi.movie_id
   WHERE kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND mi.info_type_id IN ('3')
     AND mi.info IN ('Comedy'))
SELECT rc.name,
       rm.info,
       MIN(rm.production_year),
       MAX(rm.production_year)
FROM relevant_cast AS rc
JOIN relevant_movies AS rm ON rc.movie_id = rm.movie_id
GROUP BY rc.name,
         rm.info;