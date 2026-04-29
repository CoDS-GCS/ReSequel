
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
WHERE t.production_year > 1950
  AND t.production_year <= 1990
  AND k.keyword IN ('anal-sex',
                    'cigarette-smoking',
                    'dog',
                    'fight',
                    'friendship',
                    'homosexual',
                    'husband-wife-relationship',
                    'lesbian-sex',
                    'mother-son-relationship',
                    'number-in-title',
                    'party',
                    'sequel',
                    'surrealism')
  AND cn.country_code IN ('[co]',
                          '[lv]',
                          '[pa]',
                          '[suhh]',
                          '[tw]',
                          '[ve]')
  AND ct.kind IN ('distributors',
                  'production companies')
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND rt.role IN ('producer')
  AND n.gender IN ('f',
                   'm');