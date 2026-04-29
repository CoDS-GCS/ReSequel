
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('movie')) AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor')
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
AND n.name_pcode_cf IN ('A5362')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors',
                   'production companies')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Warner Home Video')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Action',
                    'Comedy',
                    'Crime',
                    'Drama',
                    'Thriller')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;