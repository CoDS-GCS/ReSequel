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
   WHERE n.gender IN ('f',
                    'm')
     AND (n.surname_pcode IN ('B5',
                           'B6',
                           'B62',
                           'B626',
                           'M2',
                           'M625',
                           'O425',
                           'P62',
                           'R3',
                           'S415',
                           'S53')
          OR n.surname_pcode IS NULL)
     AND rt.role IN ('actor',
                   'cinematographer',
                   'director',
                   'producer')),
     movie_comp AS
  (SELECT mc.movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.name IN ('Columbia Broadcasting System (CBS)',
                   'Metro-Goldwyn-Mayer (MGM)',
                   'Pathé Frères',
                   'Universal Pictures')
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