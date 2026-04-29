WITH title_kind AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode')),
     cast_name_role AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN name n ON ci.person_id = n.id
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f',
                    'm')
     AND (n.surname_pcode IN ('B65',
                           'C2',
                           'H4',
                           'J525',
                           'L2',
                           'R2',
                           'S53',
                           'T46',
                           'W452')
          OR n.surname_pcode IS NULL)
     AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'director')),
     movie_comp AS
  (SELECT mc.movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('British Broadcasting Corporation (BBC)',
                   'National Broadcasting Company (NBC)')
     AND ct.kind IN ('distributors')),
     movie_info_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('2')
     AND mi.info IN ('Black and White',
                    'Color'))
SELECT COUNT(*)
FROM title_kind t
JOIN cast_name_role ci ON t.id = ci.movie_id
JOIN movie_comp mc ON t.id = mc.movie_id
JOIN movie_info_filtered mi ON t.id = mi.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;