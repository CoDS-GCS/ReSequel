WITH mi_it1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('8')
     AND mi1.info IN ('USA')),
     ci_n_rt AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress',
                   'producer')
     AND n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('C6231',
                           'C6425',
                           'D5162',
                           'E4213',
                           'F6524',
                           'F6525',
                           'R1632',
                           'R2632')
          OR n.name_pcode_nf IS NULL)),
     mc_cn_ct AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Independent Television (ITV)',
                   'Shout! Factory',
                   'Sony Pictures Home Entertainment',
                   'Universal Pictures')
     AND ct.kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN mi_it1 ON t.id = mi_it1.movie_id
JOIN ci_n_rt ON t.id = ci_n_rt.movie_id
JOIN mc_cn_ct ON t.id = mc_cn_ct.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series');