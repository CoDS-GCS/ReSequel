WITH mi_it1 AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('7')
     AND mi1.info IN ('CAM:Panavision Cameras and Lenses',
                    'MET:300 m',
                    'PCS:Kinescope',
                    'PCS:Super 35',
                    'PFM:35 mm',
                    'PFM:70 mm',
                    'PFM:D-Cinema',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1')),
     ci_n_rt AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE rt.role IN ('actress')
     AND n.gender IN ('f')
     AND (n.name_pcode_nf IN ('D5162',
                           'E4213',
                           'J5215',
                           'M6263')
          OR n.name_pcode_nf IS NULL)),
     mc_cn_ct AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Paramount Pictures',
                   'Pathé Frères',
                   'Universal Pictures',
                   'Warner Home Video')
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series');