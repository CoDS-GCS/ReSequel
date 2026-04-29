
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year > 1900
     AND t.production_year <= 2015
     AND kt.kind IN ('movie')) AS ft
JOIN
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('non-fiction',
                    'nudity')) AS fk ON ft.id = fk.movie_id
JOIN
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.country_code IN ('[no]',
                          '[pe]',
                          '[rs]')
     AND ct.kind IN ('distributors',
                  'production companies')) AS fc ON ft.id = fc.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('cinematographer',
                  'production designer')) AS f_cast ON ft.id = f_cast.movie_id;