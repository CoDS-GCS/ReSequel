WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 2015
     AND kt.kind ILIKE '%m%'),
     filtered_companies AS
  (SELECT mc.movie_id,
          cn.name
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE cn.name ILIKE '%ch%'),
     filtered_info AS
  (SELECT mi.movie_id
   FROM movie_info AS mi
   WHERE mi.info_type_id IN ('8')
     AND mi.info ILIKE '%usa%'),
     filtered_cast AS
  (SELECT ci.movie_id,
          n.gender,
          rt.role
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'editor',
                   'producer'))
SELECT fc.gender,
       fc.role,
       fcomp.name,
       COUNT(*)
FROM filtered_titles AS ft
JOIN filtered_info AS fi ON ft.id = fi.movie_id
JOIN filtered_companies AS fcomp ON ft.id = fcomp.movie_id
JOIN filtered_cast AS fc ON ft.id = fc.movie_id
GROUP BY fc.gender,
         fc.role,
         fcomp.name
ORDER BY COUNT(*) DESC;