WITH t_kt AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year >= 1875
     AND t.production_year <= 1975
     AND kt.kind IN ('tv movie',
                   'tv series')),
     t_kt_mi AS
  (SELECT t_kt.id
   FROM t_kt
   JOIN movie_info AS mi1 ON t_kt.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE it1.id IN ('4')
     AND mi1.info IN ('English')),
     t_kt_mi_ci AS
  (SELECT t_kt_mi.id
   FROM t_kt_mi
   JOIN cast_info AS ci ON t_kt_mi.id = ci.movie_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actress')
     AND (n.gender IN ('f')
          OR n.gender IS NULL)
     AND (n.name_pcode_nf IN ('B6161',
                           'C6235',
                           'D5162',
                           'K6235')
          OR n.name_pcode_nf IS NULL))
SELECT COUNT(*)
FROM t_kt_mi_ci
JOIN movie_companies AS mc ON t_kt_mi_ci.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
JOIN company_name AS cn ON mc.company_id = cn.id
JOIN movie_keyword AS mk ON t_kt_mi_ci.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE ct.kind IN ('distributors')
  AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'General Film Company',
                   'National Broadcasting Company (NBC)',
                   'Universal Film Manufacturing Company');