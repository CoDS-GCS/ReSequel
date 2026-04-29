WITH title_kind AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('episode',
                   'movie')),
     cast_name_role AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN name n ON ci.person_id = n.id
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND (n.surname_pcode IN ('B42',
                           'B62',
                           'B65',
                           'F652',
                           'H2',
                           'H4',
                           'J52',
                           'L',
                           'L2',
                           'M6',
                           'R2')
          OR n.surname_pcode IS NULL)
     AND rt.role IN ('actress',
                   'miscellaneous crew')),
     movie_comp AS
  (SELECT mc.movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'Warner Home Video')
     AND ct.kind IN ('distributors',
                   'production companies')),
     movie_info_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English'))
SELECT COUNT(*)
FROM title_kind t
JOIN cast_name_role ci ON t.id = ci.movie_id
JOIN movie_comp mc ON t.id = mc.movie_id
JOIN movie_info_filtered mi ON t.id = mi.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;