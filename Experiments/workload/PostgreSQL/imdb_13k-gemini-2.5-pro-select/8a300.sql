WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('episode',
                   'movie')),
     mi_it1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('2')
     AND mi1.info IN ('Black and White',
                    'Color')),
     ci_n_rt AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor')
     AND n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('B1626',
                           'C6426',
                           'F6521',
                           'F6524',
                           'J52',
                           'J5265',
                           'J5425',
                           'R1631',
                           'R1635',
                           'R1636',
                           'R2632',
                           'R2635')
          OR n.name_pcode_nf IS NULL)),
     mc_cn_ct AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Paramount Pictures',
                   'Pathé Frères',
                   'Universal Pictures',
                   'Warner Home Video')
     AND ct.kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM t_kt
JOIN mi_it1 ON t_kt.id = mi_it1.movie_id
JOIN ci_n_rt ON t_kt.id = ci_n_rt.movie_id
JOIN mc_cn_ct ON t_kt.id = mc_cn_ct.movie_id
JOIN movie_keyword AS mk ON t_kt.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;