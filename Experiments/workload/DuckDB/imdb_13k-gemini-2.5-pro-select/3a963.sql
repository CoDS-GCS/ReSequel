
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
WHERE t.production_year > 1975
  AND t.production_year <= 2015
  AND k.keyword IN ('accretion',
                    'chosen',
                    'disguised-as-indians',
                    'ningxia-province-china',
                    'photography-book',
                    'rhode-island-school-of-design')
  AND cn.country_code IN ('[cz]',
                          '[ddde]',
                          '[ee]',
                          '[il]',
                          '[lb]',
                          '[ro]')
  AND ct.kind IN ('distributors',
                  'production companies')
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie')
  AND rt.role IN ('producer',
                  'writer')
  AND n.gender IN ('f',
                   'm');