
SELECT COUNT(*)
FROM role_type AS rt
JOIN cast_info AS ci ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.production_year > 1925
  AND t.production_year <= 1975
  AND k.keyword IN ('anal-sex',
                    'blood',
                    'family-relationships',
                    'hospital',
                    'number-in-title')
  AND cn.country_code IN ('[al]',
                          '[ddde]',
                          '[ee]',
                          '[is]',
                          '[ro]',
                          '[sg]')
  AND ct.kind IN ('distributors',
                  'production companies')
  AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
  AND rt.role IN ('director',
                  'producer')
  AND n.gender IN ('f',
                   'm');