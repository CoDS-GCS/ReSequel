
SELECT COUNT(*)
FROM title AS t
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_name AS cn ON cn.id = mc.company_id
JOIN company_type AS ct ON ct.id = mc.company_type_id
JOIN kind_type AS kt ON kt.id = t.kind_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE t.production_year > 1925
  AND t.production_year <= 1975
  AND k.keyword IN ('doctor',
                    'family-relationships',
                    'father-son-relationship',
                    'flashback',
                    'hospital',
                    'murder',
                    'new-york-city',
                    'revenge')
  AND cn.country_code IN ('[ar]',
                          '[be]',
                          '[br]',
                          '[fr]',
                          '[ie]',
                          '[pl]',
                          '[se]')
  AND ct.kind IN ('distributors',
                  'production companies')
  AND kt.kind IN ('tv series',
                  'video game',
                  'video movie')
  AND rt.role IN ('cinematographer',
                  'director')
  AND n.gender IN ('f');