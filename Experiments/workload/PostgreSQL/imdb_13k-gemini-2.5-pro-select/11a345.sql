WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON kt.id = t.kind_id
   WHERE kt.kind ILIKE '%m%'
     AND t.production_year BETWEEN 1875 AND 1945),
     filtered_movie_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('8')
     AND mi1.info ILIKE '%can%'),
     filtered_companies AS
  (SELECT mc.movie_id,
          cn.name
   FROM company_name AS cn
   JOIN movie_companies AS mc ON cn.id = mc.company_id
   WHERE cn.name ILIKE '%fi%'),
     filtered_cast AS
  (SELECT ci.movie_id,
          ci.person_id,
          rt.role
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'cinematographer',
                   'composer',
                   'costume designer',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer'))
SELECT n.gender,
       fci.role,
       fc.name,
       COUNT(*)
FROM filtered_titles AS ft
JOIN filtered_movie_info AS fmi ON ft.id = fmi.movie_id
JOIN filtered_companies AS fc ON ft.id = fc.movie_id
JOIN filtered_cast AS fci ON ft.id = fci.movie_id
JOIN name AS n ON fci.person_id = n.id
GROUP BY n.gender,
         fci.role,
         fc.name
ORDER BY COUNT(*) DESC;