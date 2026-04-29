WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
SELECT COUNT(*)
FROM
  (SELECT movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('dagestan',
                     'darjeeling-india',
                     'dog-track',
                     'hitting-employee',
                     'jumping-onto-train',
                     'truel',
                     'zira') INTERSECT SELECT movie_id
   FROM movie_companies mc
   JOIN company_name cn ON mc.company_id = cn.id
   JOIN company_type ct ON mc.company_type_id = ct.id
   WHERE cn.country_code IN ('[ae]',
                           '[cu]',
                           '[il]',
                           '[is]',
                           '[lv]',
                           '[nz]',
                           '[pl]',
                           '[pr]',
                           '[ro]',
                           '[suhh]',
                           '[tr]',
                           '[tw]')
     AND ct.kind IN ('distributors',
                   'production companies') INTERSECT SELECT movie_id
   FROM cast_info ci
   JOIN name n ON ci.person_id = n.id
   JOIN role_type rt ON ci.role_id = rt.id
   WHERE n.gender IN ('f')
     AND rt.role IN ('cinematographer') INTERSECT SELECT id
   FROM filtered_titles) AS final_movie_ids;