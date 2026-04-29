WITH filtered_bridges AS
  (SELECT mk.movie_id
   FROM
     (SELECT movie_id
      FROM movie_keyword mk
      JOIN keyword k ON mk.keyword_id = k.id
      WHERE k.keyword IN ('city-folklore',
                    'corpse-with-eyes-open',
                    'countdown-timer',
                    'downsizing',
                    'female-sex-slave',
                    'girlfriend-tells-boyfriend-his-penis-is-too-small',
                    'ideologist',
                    'megaride-italy',
                    'muscular',
                    'new-london-connecticut',
                    'queen-anne',
                    'soiferman',
                    'strapped-to-table',
                    'sympathetic-police-officer',
                    'trebia-river')) AS mk
   JOIN
     (SELECT movie_id
      FROM movie_companies mc
      JOIN company_name cn ON mc.company_id = cn.id
      JOIN company_type ct ON mc.company_type_id = ct.id
      WHERE cn.country_code IN ('[al]',
                          '[cn]',
                          '[cu]',
                          '[ee]',
                          '[pa]',
                          '[th]',
                          '[tr]',
                          '[xyu]')
        AND ct.kind IN ('distributors',
                  'production companies')) AS mc ON mk.movie_id = mc.movie_id
   JOIN
     (SELECT movie_id
      FROM cast_info ci
      JOIN name n ON ci.person_id = n.id
      JOIN role_type rt ON ci.role_id = rt.id
      WHERE n.gender IN ('f')
        AND rt.role IN ('costume designer')) AS ci ON mk.movie_id = ci.movie_id)
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN filtered_bridges AS fb ON t.id = fb.movie_id
WHERE t.production_year > 1975
  AND t.production_year <= 2015
  AND kt.kind IN ('episode',
                  'movie',
                  'video movie');