WITH filtered_casts AS
  (SELECT ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('A6521',
                           'B6563',
                           'G6435',
                           'J5162',
                           'J5216',
                           'R1636',
                           'R2635')
     AND rt.role IN ('actor',
                   'producer'))
SELECT COUNT(*)
FROM filtered_casts AS fc
JOIN title AS t ON fc.movie_id = t.id
AND t.production_year BETWEEN 1990 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'tv series')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;