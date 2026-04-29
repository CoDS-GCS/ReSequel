WITH filtered_cast AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   JOIN role_type AS rt ON ci.role_id = rt.id
   WHERE n.gender IS NULL
     AND n.surname_pcode IN ('B4',
                           'B6',
                           'B624',
                           'C5',
                           'D12',
                           'D5',
                           'G65',
                           'K5',
                           'L',
                           'L2',
                           'L52',
                           'M2',
                           'W3')
     AND rt.role IN ('director',
                   'miscellaneous crew',
                   'producer')),
     filtered_companies AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_name AS cn ON mc.company_id = cn.id
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Fox Network',
                   'Independent Television (ITV)',
                   'National Broadcasting Company (NBC)',
                   'Paramount Pictures',
                   'Shout! Factory',
                   'Sony Pictures Home Entertainment',
                   'Universal Pictures',
                   'Universal TV',
                   'Warner Bros')
     AND ct.kind IN ('distributors',
                   'production companies'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN filtered_cast AS fc ON t.id = fc.movie_id
JOIN filtered_companies AS fco ON t.id = fco.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
  AND mi1.info IN ('Dolby Digital',
                    'Dolby',
                    'Mono',
                    'Stereo')
  AND it1.id IN ('6');