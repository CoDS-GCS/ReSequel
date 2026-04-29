
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode'))
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('60')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND n.gender IN ('f',
                    'm')
  AND (n.surname_pcode IN ('B65',
                           'C5',
                           'D25',
                           'F652',
                           'L',
                           'M6',
                           'R2',
                           'S532')
       OR n.surname_pcode IS NULL)
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors',
                   'production companies'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)'));