
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv series'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Adventure',
                    'Comedy')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer'))
  AND n.gender IN ('m')
  AND (n.surname_pcode IN ('B24',
                           'C62',
                           'D12',
                           'D4',
                           'J25',
                           'M324',
                           'S23',
                           'S415',
                           'S5',
                           'S53')
       OR n.surname_pcode IS NULL)
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors',
                   'production companies'))
  AND mc.company_id IN
    (SELECT id
     FROM company_name
     WHERE name IN ('American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video'));