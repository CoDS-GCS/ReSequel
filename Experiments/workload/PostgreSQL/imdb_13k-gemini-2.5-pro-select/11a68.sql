WITH title_info AS
  (SELECT t.id AS movie_id
   FROM title AS t
   JOIN kind_type AS kt ON kt.id = t.kind_id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   WHERE kt.kind ILIKE '%v%'
     AND t.production_year BETWEEN 1875 AND 1945
     AND mi1.info_type_id IN ('2')
     AND mi1.info ILIKE '%col%'),
     cast_company AS
  (SELECT ci.movie_id,
          n.gender,
          rt.role,
          cn.name
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN movie_companies AS mc ON ci.movie_id = mc.movie_id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'costume designer',
                   'director',
                   'editor',
                   'guest',
                   'miscellaneous crew',
                   'producer',
                   'production designer',
                   'writer')
     AND cn.name ILIKE '%ko%')
SELECT cc.gender,
       cc.role,
       cc.name,
       COUNT(*)
FROM title_info ti
JOIN cast_company cc ON ti.movie_id = cc.movie_id
GROUP BY cc.gender,
         cc.role,
         cc.name
ORDER BY COUNT(*) DESC;