
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
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND k.keyword IN ('blood',
                     'death',
                     'female-frontal-nudity',
                     'flashback',
                     'kidnapping',
                     'new-york-city',
                     'singing',
                     'suicide',
                     'surrealism')
     AND cn.country_code IN ('[ae]',
                           '[bg]',
                           '[cl]',
                           '[ddde]',
                           '[lb]',
                           '[mx]',
                           '[my]',
                           '[si]',
                           '[suhh]')
     AND ct.kind IN ('distributors',
                   'production companies')
     AND n.gender IN ('m')
     AND rt.role IN ('cinematographer')
   GROUP BY t.id) AS sub;