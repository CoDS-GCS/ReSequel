
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
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND k.keyword IN ('blood',
                     'doctor',
                     'flashback',
                     'friendship',
                     'gun',
                     'hardcore',
                     'husband-wife-relationship',
                     'interview',
                     'jealousy',
                     'lesbian',
                     'lesbian-sex',
                     'mother-son-relationship',
                     'new-york-city',
                     'tv-mini-series')
     AND cn.country_code IN ('[bg]',
                           '[cl]',
                           '[cz]',
                           '[il]',
                           '[lb]',
                           '[lu]',
                           '[mx]')
     AND ct.kind IN ('distributors',
                   'production companies')
     AND n.gender IN ('f')
     AND rt.role IN ('costume designer',
                   'writer')
   GROUP BY t.id) AS sub;