
SELECT COUNT(*)
FROM title AS t
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
WHERE t.production_year > 1950
  AND t.production_year <= 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                  'movie',
                  'tv movie'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('attracted-to-light',
                    'emergency-contraception',
                    'fearless-fred',
                    'folding',
                    'ice-milk',
                    'inside-car-in-car-wash',
                    'marching-formation-on-football-field',
                    'martin-luther-king-high-school',
                    'military-encampment',
                    'partial-recall',
                    'press-gallery',
                    'sitting-on-a-porch',
                    'the-factory-manhattan-new-york-city'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE country_code IN ('[be]',
                          '[ca]',
                          '[fi]',
                          '[gb]',
                          '[hk]',
                          '[ie]',
                          '[pt]',
                          '[se]'))
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors',
                  'production companies'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                   'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                  'writer'));