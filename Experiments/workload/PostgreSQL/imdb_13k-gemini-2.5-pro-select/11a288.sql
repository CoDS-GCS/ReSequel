WITH filtered_cast AS
  (SELECT ci.movie_id,
          ci.person_id,
          rt.role
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'composer',
                   'costume designer',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')),
     filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON kt.id = t.kind_id
   WHERE kt.kind ILIKE '%m%'
     AND t.production_year BETWEEN 1875 AND 2015),
     filtered_movie_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('5')
     AND mi1.info ILIKE '%m%'),
     filtered_companies AS
  (SELECT mc.movie_id,
          cn.name
   FROM company_name AS cn
   JOIN movie_companies AS mc ON cn.id = mc.company_id
   WHERE cn.name ILIKE '%and%')
SELECT n.gender,
       fci.role,
       fc.name,
       COUNT(*)
FROM filtered_cast AS fci
JOIN name AS n ON fci.person_id = n.id
JOIN filtered_titles AS ft ON fci.movie_id = ft.id
JOIN filtered_movie_info AS fmi ON fci.movie_id = fmi.movie_id
JOIN filtered_companies AS fc ON fci.movie_id = fc.movie_id
GROUP BY n.gender,
         fci.role,
         fc.name
ORDER BY COUNT(*) DESC;