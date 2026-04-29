
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   JOIN keyword AS k ON mk.keyword_id = k.id
   JOIN movie_companies AS mc ON t.id = mc.movie_id
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN cast_info AS ci ON t.id = ci.movie_id
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE t.production_year BETWEEN 1900 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series')
     AND k.keyword IN ('kidnapping',
                     'party',
                     'sex',
                     'singing',
                     'tv-mini-series')
     AND cn.country_code IN ('[ae]',
                           '[cl]',
                           '[ve]')
     AND ct.kind IN ('distributors',
                   'production companies')
     AND n.gender IN ('m')
     AND rt.role IN ('production designer')
   GROUP BY t.id) AS sub;