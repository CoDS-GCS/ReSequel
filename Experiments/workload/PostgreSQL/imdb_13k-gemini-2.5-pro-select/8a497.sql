
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie')
     AND mi1.info IN ('Canada:PG',
                    'Norway:15')
     AND it1.id IN ('5')) AS ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f')
AND n.name_pcode_nf IN ('B6161',
                           'C6235',
                           'K3451',
                           'M6263')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actress')
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video')
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;