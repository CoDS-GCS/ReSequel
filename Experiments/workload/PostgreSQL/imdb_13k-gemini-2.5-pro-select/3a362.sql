
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1900 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'video game'))
  AND EXISTS
    (SELECT 1
     FROM movie_keyword AS mk
     JOIN keyword AS k ON mk.keyword_id = k.id
     WHERE mk.movie_id = t.id
       AND k.keyword IN ('faking-stigmata',
                     'lawman',
                     'machine-monster',
                     'paris-plage',
                     'valley-girls'))
  AND EXISTS
    (SELECT 1
     FROM movie_companies AS mc
     JOIN company_name AS cn ON mc.company_id = cn.id
     JOIN company_type AS ct ON mc.company_type_id = ct.id
     WHERE mc.movie_id = t.id
       AND cn.country_code IN ('[au]',
                           '[de]',
                           '[hk]',
                           '[ng]')
       AND ct.kind IN ('distributors',
                   'production companies'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('m')
       AND rt.role IN ('cinematographer',
                   'writer'));