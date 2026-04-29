
SELECT COUNT(*)
FROM title AS t
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
WHERE t.production_year > 1925
  AND t.production_year <= 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                  'tv movie'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('all-girl-baseball-team',
                    'communion-service-music',
                    'dumb-surgeon',
                    'fat-dancer-with-multiple-partners',
                    'german-autumn',
                    'kathakali',
                    'knocking-on-someones-head',
                    'military-induction-physical-exam',
                    'perfect-attendance',
                    'pete-rose-reference',
                    'renting-apartment',
                    'shooting-a-coin-tossed-in-the-air',
                    'time-capsule',
                    'versailles-hotel-miami'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE country_code IN ('[ar]',
                          '[au]',
                          '[br]',
                          '[gr]',
                          '[ru]',
                          '[sg]'))
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
     WHERE ROLE IN ('actor',
                  'producer'));