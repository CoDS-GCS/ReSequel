
SELECT COUNT(*)
FROM
  (SELECT ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('C6231',
                           'H526',
                           'H626',
                           'J2423',
                           'J2516')
     AND rt.role IN ('actor',
                   'composer')) AS fc
JOIN title AS t ON fc.movie_id = t.id
AND t.production_year BETWEEN 1975 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('ABS-CBN',
                   'Fox Network',
                   'Sony Pictures Home Entertainment',
                   'Warner Bros. Television')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('30')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('1')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;