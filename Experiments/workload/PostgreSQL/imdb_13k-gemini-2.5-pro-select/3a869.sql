
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
     WHERE kind IN ('tv series',
                  'video movie'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('blood',
                    'dancing',
                    'doctor',
                    'family-relationships',
                    'father-daughter-relationship',
                    'fight',
                    'gay',
                    'love',
                    'murder',
                    'party',
                    'police'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE country_code IN ('[al]',
                          '[ddde]',
                          '[kr]',
                          '[lb]',
                          '[ve]'))
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress'));