WITH filtered_name AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND (surname_pcode IN ('B6',
                           'G6',
                           'H62',
                           'L',
                           'L2',
                           'L52',
                           'O425',
                           'S415',
                           'T52')
          OR surname_pcode IS NULL)),
     filtered_company AS
  (SELECT id
   FROM company_name
   WHERE name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video'))
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_name AS n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series'))
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'cinematographer'))
  AND mc.company_type_id IN
    (SELECT id
     FROM company_type
     WHERE kind IN ('distributors'))
  AND mc.company_id IN
    (SELECT id
     FROM filtered_company);