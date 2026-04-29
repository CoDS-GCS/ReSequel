WITH valid_movie_ids AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'tv series'))
     AND EXISTS
       (SELECT 1
        FROM movie_info mi1
        WHERE mi1.movie_id = t.id
          AND mi1.info_type_id IN ('4')
          AND mi1.info IN ('English'))
     AND EXISTS
       (SELECT 1
        FROM cast_info ci
        JOIN name n ON ci.person_id = n.id
        WHERE ci.movie_id = t.id
          AND ci.role_id IN
            (SELECT id
             FROM role_type
             WHERE ROLE IN ('composer',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
          AND n.gender IS NULL
          AND n.name_pcode_cf IN ('A2365',
                           'A6252',
                           'D1614',
                           'E1524',
                           'L1214',
                           'L2',
                           'M3425',
                           'M6352',
                           'P5215',
                           'Q5325',
                           'R2425',
                           'R3626',
                           'S5325',
                           'V4626'))
     AND EXISTS
       (SELECT 1
        FROM movie_keyword mk
        WHERE mk.movie_id = t.id)
     AND EXISTS
       (SELECT 1
        FROM movie_companies mc
        WHERE mc.movie_id = t.id
          AND mc.company_id IN
            (SELECT id
             FROM company_name
             WHERE name IN ('20th Century Fox Television',
                   'ABS-CBN',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Granada Television',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video'))
          AND mc.company_type_id IN
            (SELECT id
             FROM company_type
             WHERE kind IN ('distributors',
                   'production companies'))))
SELECT COUNT(*)
FROM valid_movie_ids vmi
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('4')
     AND info IN ('English')) AS mi1 ON vmi.id = mi1.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN name n ON ci.person_id = n.id
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('composer',
                   'editor',
                   'miscellaneous crew',
                   'producer'))
     AND n.gender IS NULL
     AND n.name_pcode_cf IN ('A2365',
                           'A6252',
                           'D1614',
                           'E1524',
                           'L1214',
                           'L2',
                           'M3425',
                           'M6352',
                           'P5215',
                           'Q5325',
                           'R2425',
                           'R3626',
                           'S5325',
                           'V4626')) AS ci ON vmi.id = ci.movie_id
JOIN movie_keyword AS mk ON vmi.id = mk.movie_id
JOIN
  (SELECT mc.movie_id
   FROM movie_companies mc
   WHERE mc.company_id IN
       (SELECT id
        FROM company_name
        WHERE name IN ('20th Century Fox Television',
                   'ABS-CBN',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Granada Television',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video'))
     AND mc.company_type_id IN
       (SELECT id
        FROM company_type
        WHERE kind IN ('distributors',
                   'production companies'))) AS mc ON vmi.id = mc.movie_id;