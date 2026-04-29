WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('tv mini series',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')),
     filtered_persons AS
  (SELECT n.id,
          n.gender
   FROM name AS n
   JOIN person_info AS pi ON n.id = pi.person_id
   JOIN info_type AS it2 ON pi.info_type_id = it2.id
   WHERE pi.info ILIKE '%car%'
     AND it2.id IN ('39')),
     filtered_cast AS
  (SELECT ci.movie_id,
          fp.gender,
          rt.role
   FROM cast_info AS ci
   JOIN filtered_persons AS fp ON ci.person_id = fp.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'cinematographer',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'producer',
                   'production designer'))
SELECT fc.gender,
       fc.role,
       cn.name,
       COUNT(*)
FROM filtered_cast AS fc
JOIN filtered_titles AS ft ON fc.movie_id = ft.id
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     JOIN info_type AS it1 ON mi1.info_type_id = it1.id
     WHERE mi1.movie_id = ft.id
       AND it1.id IN ('4')
       AND mi1.info ILIKE '%heb%')
GROUP BY fc.gender,
         fc.role,
         cn.name
ORDER BY COUNT(*) DESC;