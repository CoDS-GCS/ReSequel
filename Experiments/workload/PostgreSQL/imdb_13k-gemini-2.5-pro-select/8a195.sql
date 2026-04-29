
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('episode',
                   'movie')) AS t_kt
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('18')
     AND mi1.info IN ('Hal Roach Studios - 8822 Washington Blvd., Culver City, California, USA',
                    'Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')) AS mi_it1 ON t_kt.id = mi_it1.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'producer')
     AND n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('B1626',
                           'C6235',
                           'C6421',
                           'C6426',
                           'D1325',
                           'F6524',
                           'F6525',
                           'J5265',
                           'R2631',
                           'S3152')
          OR n.name_pcode_nf IS NULL)) AS ci_n_rt ON t_kt.id = ci_n_rt.movie_id
JOIN
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Home Video')
     AND ct.kind IN ('distributors')) AS mc_cn_ct ON t_kt.id = mc_cn_ct.movie_id
JOIN movie_keyword AS mk ON t_kt.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;