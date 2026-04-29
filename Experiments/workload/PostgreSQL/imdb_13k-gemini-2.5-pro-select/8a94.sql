WITH title_kind AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
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
                           'H2',
                           'J52',
                           'L',
                           'L2',
                           'M6',
                           'R2')
          OR n.surname_pcode IS NULL)
     AND rt.role IN ('actress',
                   'costume designer',
                   'producer',
                   'writer')),
     movie_comp AS
  (SELECT mc.movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'General Film Company',
                   'National Broadcasting Company (NBC)',
                   'Pathé Frères',
                   'Universal Film Manufacturing Company')
     AND ct.kind IN ('distributors')),
     movie_info_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Argentina:Atp',
                    'Australia:G',
                    'Finland:K-16',
                    'Netherlands:12',
                    'Sweden:15',
                    'USA:TV-14',
                    'USA:TV-PG'))
SELECT COUNT(*)
FROM title_kind t
JOIN cast_name_role ci ON t.id = ci.movie_id
JOIN movie_comp mc ON t.id = mc.movie_id
JOIN movie_info_filtered mi ON t.id = mi.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;