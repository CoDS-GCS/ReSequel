WITH t_kt_mk_k AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE t.production_year > 1875
     AND t.production_year <= 1975
     AND kt.kind IN ('episode',
                  'movie',
                  'tv movie')
     AND k.keyword IN ('bare-breasts',
                    'bare-chested-male',
                    'blood',
                    'character-name-in-title',
                    'dancing',
                    'death',
                    'friendship',
                    'gay',
                    'gun',
                    'husband-wife-relationship',
                    'love',
                    'one-word-title',
                    'singer',
                    'singing')),
     t_kt_mk_k_mc_cn_ct AS
  (SELECT t.id
   FROM t_kt_mk_k AS t
   JOIN movie_companies AS mc ON t.id = mc.movie_id
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.country_code IN ('[bg]',
                          '[cl]',
                          '[co]',
                          '[cshh]',
                          '[ro]')
     AND ct.kind IN ('distributors',
                  'production companies'))
SELECT COUNT(*)
FROM t_kt_mk_k_mc_cn_ct AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE n.gender IN ('f',
                   'm')
  AND rt.role IN ('actress',
                  'composer');