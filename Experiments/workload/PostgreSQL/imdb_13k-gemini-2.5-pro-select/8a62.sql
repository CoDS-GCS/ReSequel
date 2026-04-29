WITH title_kind AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('episode',
                   'tv series')),
     cast_name_role AS
  (SELECT ci.movie_id
   FROM cast_info ci
   JOIN name n ON ci.person_id = n.id
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE n.gender IN ('m')
     AND (n.surname_pcode IN ('B452',
                           'B635',
                           'B653',
                           'C42',
                           'C52',
                           'C63',
                           'G52',
                           'K5',
                           'K62',
                           'L6',
                           'M52',
                           'O2',
                           'R25')
          OR n.surname_pcode IS NULL)
     AND rt.role IN ('actor',
                   'producer',
                   'production designer',
                   'writer')),
     movie_comp AS
  (SELECT mc.movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('ABS-CBN',
                   'American Broadcasting Company (ABC)',
                   'British Broadcasting Corporation (BBC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)',
                   'Warner Bros. Television')
     AND ct.kind IN ('distributors',
                   'production companies')),
     movie_info_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('30',
                    '60',
                    'USA:30',
                    'USA:60'))
SELECT COUNT(*)
FROM title_kind t
JOIN cast_name_role ci ON t.id = ci.movie_id
JOIN movie_comp mc ON t.id = mc.movie_id
JOIN movie_info_filtered mi ON t.id = mi.movie_id
JOIN movie_keyword mk ON t.id = mk.movie_id
JOIN keyword k ON mk.keyword_id = k.id;