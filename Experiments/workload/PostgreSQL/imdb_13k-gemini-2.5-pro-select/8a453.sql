WITH filtered_cast AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'director',
                   'producer')
     AND n.gender IN ('m')
     AND n.name_pcode_cf IN ('A4361',
                           'B6525',
                           'B6535',
                           'C6325',
                           'G6262',
                           'L5352',
                           'M6256',
                           'P6252',
                           'R1525',
                           'R2632',
                           'S4153',
                           'W4525')),
     filtered_company AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)')
     AND ct.kind IN ('distributors')),
     filtered_info AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('5')
     AND mi1.info IN ('Australia:PG',
                    'Canada:PG',
                    'Singapore:PG',
                    'UK:PG'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN filtered_cast AS fc ON t.id = fc.movie_id
JOIN filtered_company AS fco ON t.id = fco.movie_id
JOIN filtered_info AS fi ON t.id = fi.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie');