WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode'))),
     mi1_filtered AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('1')
     AND mi1.info IN ('30',
                    '60',
                    'USA:30',
                    'USA:60')),
     ci_filtered AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   WHERE ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor',
                   'actress'))
     AND n.gender IN ('f',
                    'm')
     AND (n.surname_pcode IN ('B5',
                           'B65',
                           'H2',
                           'K4',
                           'M25',
                           'M635',
                           'O425',
                           'R3',
                           'S23',
                           'S53',
                           'T52',
                           'W452')
          OR n.surname_pcode IS NULL)),
     mc_filtered AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   WHERE mc.company_type_id IN
       (SELECT id
        FROM company_type
        WHERE kind IN ('distributors'))
     AND mc.company_id IN
       (SELECT id
        FROM company_name
        WHERE name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)')))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN mi1_filtered AS mi1 ON t.id = mi1.movie_id
JOIN ci_filtered AS ci ON t.id = ci.movie_id
JOIN mc_filtered AS mc ON t.id = mc.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;