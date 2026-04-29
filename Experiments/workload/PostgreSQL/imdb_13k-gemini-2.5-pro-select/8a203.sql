WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'tv series')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor')),
     filtered_it AS
  (SELECT id
   FROM info_type
   WHERE id IN ('1')),
     filtered_ct AS
  (SELECT id
   FROM company_type
   WHERE kind IN ('distributors',
                   'production companies')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     AND name_pcode_cf IN ('B6526',
                           'M6256',
                           'R1525',
                           'R2632',
                           'S4153',
                           'S5362')),
     filtered_cn AS
  (SELECT id
   FROM company_name
   WHERE name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt rt ON ci.role_id = rt.id
JOIN filtered_n n ON ci.person_id = n.id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN filtered_ct ct ON mc.company_type_id = ct.id
JOIN filtered_cn cn ON mc.company_id = cn.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN filtered_it it1 ON mi1.info_type_id = it1.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1950 AND 1990
  AND mi1.info IN ('30',
                    'USA:60');