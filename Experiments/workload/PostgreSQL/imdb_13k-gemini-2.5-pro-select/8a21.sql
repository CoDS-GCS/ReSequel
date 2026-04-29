
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('movie',
                   'tv movie',
                   'tv series')) AS t
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('2')
     AND mi1.info IN ('Color')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'producer',
                   'writer')
     AND n.gender IN ('f',
                    'm')
     AND n.surname_pcode IN ('B2',
                           'B626',
                           'C16',
                           'C64',
                           'F652',
                           'G62',
                           'H2',
                           'H3',
                           'J25',
                           'L6',
                           'M5',
                           'M62',
                           'O165',
                           'S52')) AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors',
                   'production companies')
     AND cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Pathé Frères',
                   'Universal Pictures',
                   'Warner Home Video')) AS mc ON t.id = mc.movie_id;