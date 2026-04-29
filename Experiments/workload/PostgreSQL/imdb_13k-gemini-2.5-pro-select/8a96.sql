
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('movie',
                   'tv series')) AS t_kt
JOIN
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('4')
     AND mi1.info IN ('English',
                    'French')) AS mi_it1 ON t_kt.id = mi_it1.movie_id
JOIN
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actor',
                   'actress')
     AND n.gender IN ('f',
                    'm')
     AND (n.name_pcode_nf IN ('A4163',
                           'B6535',
                           'C6231',
                           'C6421',
                           'C6426',
                           'J5252',
                           'J5262',
                           'K6235',
                           'M2425',
                           'M4145',
                           'M6263',
                           'R1634',
                           'R1636')
          OR n.name_pcode_nf IS NULL)) AS ci_n_rt ON t_kt.id = ci_n_rt.movie_id
JOIN
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Fox Network',
                   'Independent Television (ITV)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'National Broadcasting Company (NBC)',
                   'Paramount Pictures',
                   'Shout! Factory',
                   'Sony Pictures Home Entertainment',
                   'Universal Pictures',
                   'Universal TV',
                   'Warner Bros')
     AND ct.kind IN ('distributors',
                   'production companies')) AS mc_cn_ct ON t_kt.id = mc_cn_ct.movie_id
JOIN movie_keyword AS mk ON t_kt.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;