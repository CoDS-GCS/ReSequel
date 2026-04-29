
SELECT COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN movie_keyword AS mk ON t.id = mk.movie_id
INNER JOIN movie_companies AS mc ON t.id = mc.movie_id
INNER JOIN company_type AS ct ON mc.company_type_id = ct.id
INNER JOIN company_name AS cn ON mc.company_id = cn.id
WHERE it1.id IN ('6')
  AND mi1.info IN ('Mono',
                    'Stereo')
  AND kt.kind IN ('episode',
                   'tv movie')
  AND rt.role IN ('production designer')
  AND n.gender IS NULL
  AND n.name_pcode_cf IN ('T5212')
  AND t.production_year BETWEEN 1950 AND 1990
  AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)')
  AND ct.kind IN ('distributors');