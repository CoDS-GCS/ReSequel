
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
     WHERE kind IN ('episode',
                   'movie'))
  AND mi1.info_type_id IN ('18')
  AND mi1.info IN ('CBS Studio 50, New York City, New York, USA',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'writer'))
  AND n.gender IN ('f')
  AND (n.surname_pcode IN ('B4',
                           'B634',
                           'C2',
                           'C5',
                           'D5',
                           'H2',
                           'H63',
                           'L52',
                           'M62',
                           'T46',
                           'W3',
                           'W42',
                           'W425')
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
                   'Pathé Frères',
                   'Universal Pictures',
                   'Warner Home Video'));