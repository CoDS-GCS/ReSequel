WITH relevant_cast AS
  (SELECT n.id AS person_id,
          n.name,
          ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   WHERE n.name ILIKE '%giacom%'
     AND ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer'))),
     relevant_info AS
  (SELECT mi.movie_id,
          mi.info
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('2',
                  '3',
                  '6')
     AND mi.info IN ('Short')),
     relevant_titles AS
  (SELECT t.id,
          t.production_year
   FROM title AS t
   WHERE t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv series',
                   'video game',
                   'video movie')))
SELECT rc.name,
       ri.info,
       MIN(rt.production_year),
       MAX(rt.production_year)
FROM relevant_cast AS rc
JOIN relevant_info AS ri ON rc.movie_id = ri.movie_id
JOIN relevant_titles AS rt ON rc.movie_id = rt.id
GROUP BY rc.name,
         ri.info;