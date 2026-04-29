WITH movie_ids AS
  (SELECT t.id,
          t.production_year,
          mi1.info
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE kt.kind IN ('tv movie',
                   'video game')
     AND mi1.info IN ('Black and White')
     AND it1.id IN ('2')),
     person_ids AS
  (SELECT n.id,
          n.name
   FROM name AS n
   WHERE n.name ILIKE '%chr%')
SELECT p.name,
       m.info,
       MIN(m.production_year),
       MAX(m.production_year)
FROM cast_info AS ci
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_ids AS m ON ci.movie_id = m.id
JOIN person_ids AS p ON ci.person_id = p.id
WHERE rt.role IN ('composer',
                   'editor',
                   'production designer',
                   'writer')
GROUP BY p.name,
         m.info;