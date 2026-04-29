
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('movie')
  AND it1.id IN ('3')
  AND mi1.info IN ('Action',
                    'Crime',
                    'Drama',
                    'Romance',
                    'Short')
  AND rt.role IN ('actor',
                   'costume designer',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.surname_pcode IN ('B62',
                           'C2',
                           'H2',
                           'J525',
                           'M46',
                           'M6',
                           'M62',
                           'S5',
                           'S53',
                           'W3')
       OR n.surname_pcode IS NULL)
  AND cn.name IN ('Universal Pictures',
                   'Warner Home Video')
  AND ct.kind IN ('distributors');