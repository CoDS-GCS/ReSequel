
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv series',
                   'video movie'))
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('UK',
                    'USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'editor'))
  AND n.gender IN ('m')
  AND (n.surname_pcode IN ('B2',
                           'B63',
                           'C45',
                           'D4',
                           'G65',
                           'H52',
                           'J525',
                           'L5',
                           'R3',
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
     WHERE name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Paramount Pictures',
                   'Universal Pictures',
                   'Warner Home Video'));