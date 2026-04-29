WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND kt.kind IN ('movie',
                   'tv series')),
     filtered_mi AS
  (SELECT mi1.movie_id
   FROM movie_info AS mi1
   WHERE mi1.info_type_id IN ('4')
     AND mi1.info IN ('English')),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN role_type AS rt ON ci.role_id = rt.id
   JOIN name AS n ON ci.person_id = n.id
   WHERE rt.role IN ('actor',
                   'writer')
     AND n.gender IN ('m')
     AND n.surname_pcode IN ('B26',
                           'D52',
                           'E152',
                           'F6',
                           'H52',
                           'L6',
                           'M24',
                           'M26',
                           'M5',
                           'P4',
                           'S4',
                           'W426')),
     filtered_mc AS
  (SELECT mc.movie_id
   FROM movie_companies AS mc
   JOIN company_type AS ct ON mc.company_type_id = ct.id
   JOIN company_name AS cn ON mc.company_id = cn.id
   WHERE ct.kind IN ('distributors')
     AND cn.name IN ('American Broadcasting Company (ABC)',
                   'Columbia Broadcasting System (CBS)',
                   'National Broadcasting Company (NBC)'))
SELECT COUNT(*)
FROM filtered_titles AS t
JOIN filtered_mi AS mi ON t.id = mi.movie_id
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_mc AS mc ON t.id = mc.movie_id;