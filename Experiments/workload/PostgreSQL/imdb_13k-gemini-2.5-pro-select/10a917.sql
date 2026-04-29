WITH relevant_movies AS
  (SELECT t.id AS movie_id,
          t.production_year,
          mi.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi ON t.id = mi.movie_id
   WHERE kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND mi.info_type_id IN ('3',
                  '4',
                  '6')
     AND mi.info IN ('Comedy'))
SELECT n.name,
       rm.info,
       MIN(rm.production_year),
       MAX(rm.production_year)
FROM relevant_movies AS rm
JOIN cast_info AS ci ON rm.movie_id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.name ILIKE '%piero%'
  AND rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer')
GROUP BY n.name,
         rm.info;