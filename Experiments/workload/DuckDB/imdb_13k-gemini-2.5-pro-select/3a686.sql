
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND EXISTS
    (SELECT 1
     FROM movie_keyword AS mk
     JOIN keyword AS k ON mk.keyword_id = k.id
     WHERE mk.movie_id = t.id
       AND k.keyword IN ('basketball-practice',
                     'child-convict',
                     'chinatown',
                     'cid',
                     'crimean-war',
                     'durium',
                     'hard-hitting',
                     'john-deere-trackor',
                     'mba',
                     'mexican-farmworker',
                     'racial-identity'))
  AND EXISTS
    (SELECT 1
     FROM movie_companies AS mc
     JOIN company_name AS cn ON mc.company_id = cn.id
     JOIN company_type AS ct ON mc.company_type_id = ct.id
     WHERE mc.movie_id = t.id
       AND cn.country_code IN ('[ar]',
                           '[ca]',
                           '[ch]',
                           '[fi]',
                           '[gb]',
                           '[gr]',
                           '[ie]',
                           '[in]',
                           '[it]',
                           '[jp]',
                           '[nl]',
                           '[pl]')
       AND ct.kind IN ('distributors',
                   'production companies'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('f')
       AND rt.role IN ('writer'));