
SELECT COUNT(*)
FROM title AS t
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
WHERE t.production_year > 1975
  AND t.production_year <= 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                  'movie'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('caboblanco-peru',
                    'cutting-down-tree',
                    'foreign-agent',
                    'georges-danton',
                    'jim-garrison',
                    'niagara-falls-new-york',
                    'night-on-the-town',
                    'setting-a-man-on-fire',
                    'sexual-aberration',
                    'spider',
                    'theatre-festival',
                    'throwing-salt',
                    'transforming-robot',
                    'vaginal-injury'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE country_code IN ('[cn]',
                          '[hr]',
                          '[kr]',
                          '[my]',
                          '[th]'))
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors',
                  'production companies'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor'));