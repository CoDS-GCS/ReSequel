
SELECT COUNT(*)
FROM
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   JOIN info_type AS it1 ON mi1.info_type_id = it1.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie')
     AND mi1.info IN ('Iceland:L',
                    'USA:PG')
     AND it1.id IN ('5')) AS ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('f',
                    'm')
AND n.name_pcode_nf IN ('A5352',
                           'C6421',
                           'D5162',
                           'E4213',
                           'F6521',
                           'F6525',
                           'J5235',
                           'J5252',
                           'J5265',
                           'K6235',
                           'R1631',
                           'R1632',
                           'R1635',
                           'R2632',
                           'S3152')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'producer')
JOIN movie_companies AS mc ON ft.id = mc.movie_id
JOIN company_name AS cn ON mc.company_id = cn.id
AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)')
JOIN company_type AS ct ON mc.company_type_id = ct.id
AND ct.kind IN ('distributors')
JOIN movie_keyword AS mk ON ft.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id;