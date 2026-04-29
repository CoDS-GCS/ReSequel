WITH filtered_casts AS
  (SELECT ci.movie_id
   FROM name AS n
   JOIN cast_info AS ci ON n.id = ci.person_id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND n.name_pcode_nf IN ('B6563',
                           'C6235',
                           'C6426',
                           'J5162',
                           'J5236',
                           'K5263',
                           'M2453',
                           'P3624',
                           'R2636',
                           'W4525')
     AND rt.role IN ('actor',
                   'producer'))
SELECT COUNT(*)
FROM filtered_casts AS fc
JOIN title AS t ON fc.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 1975
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'tv movie')
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors')
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info IN ('Mono',
                    'Stereo')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('6')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;