
SELECT COUNT(*)
FROM title AS t
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
WHERE t.production_year > 1875
  AND t.production_year <= 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                  'video game',
                  'video movie'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('bare-breasts',
                    'dancing',
                    'death',
                    'dog',
                    'family-relationships',
                    'father-daughter-relationship',
                    'female-nudity',
                    'friendship',
                    'gay',
                    'love',
                    'nudity',
                    'number-in-title',
                    'party',
                    'song'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE country_code IN ('[bg]',
                          '[cshh]',
                          '[cu]',
                          '[ee]',
                          '[ir]',
                          '[ro]',
                          '[ve]'))
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
     WHERE ROLE IN ('miscellaneous crew',
                  'writer'));