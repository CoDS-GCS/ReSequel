WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year > 1950
     AND t.production_year <= 1990
     AND kt.kind IN ('tv series',
                  'video game',
                  'video movie'))
SELECT COUNT(*)
FROM filtered_titles t
WHERE EXISTS
    (SELECT 1
     FROM movie_keyword mk
     JOIN keyword k ON mk.keyword_id = k.id
     WHERE mk.movie_id = t.id
       AND k.keyword IN ('attu-alaska',
                    'baby-formula',
                    'borrowing-salt',
                    'champagne-in-vagina',
                    'dust-covered-carpet',
                    'interview-the-magazine',
                    'keypad',
                    'limbo-the-dance',
                    'loch',
                    'ludwigslust',
                    'reece',
                    'reference-to-general-sherman',
                    'reference-to-silvio-berlusconi',
                    'skate-team',
                    'third-in-series'))
  AND EXISTS
    (SELECT 1
     FROM movie_companies mc
     JOIN company_name cn ON mc.company_id = cn.id
     JOIN company_type ct ON mc.company_type_id = ct.id
     WHERE mc.movie_id = t.id
       AND cn.country_code IN ('[ar]',
                          '[dk]',
                          '[es]',
                          '[gb]',
                          '[ie]',
                          '[it]',
                          '[mx]',
                          '[ph]')
       AND ct.kind IN ('distributors',
                  'production companies'))
  AND EXISTS
    (SELECT 1
     FROM cast_info ci
     JOIN name n ON ci.person_id = n.id
     JOIN role_type rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('f')
       AND rt.role IN ('composer',
                  'production designer'));