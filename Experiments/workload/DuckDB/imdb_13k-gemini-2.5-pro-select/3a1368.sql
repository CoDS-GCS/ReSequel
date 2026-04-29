
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year > 1950
  AND t.production_year <= 1990
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv series',
                  'video game',
                  'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_keyword AS mk
     JOIN keyword AS k ON k.id = mk.keyword_id
     WHERE mk.movie_id = t.id
       AND k.keyword IN ('death',
                    'flashback',
                    'murder',
                    'suicide',
                    'violence'))
  AND EXISTS
    (SELECT 1
     FROM movie_companies AS mc
     JOIN company_name AS cn ON cn.id = mc.company_id
     JOIN company_type AS ct ON ct.id = mc.company_type_id
     WHERE mc.movie_id = t.id
       AND cn.country_code IN ('[al]',
                          '[cn]',
                          '[eg]',
                          '[il]')
       AND ct.kind IN ('distributors',
                  'production companies'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON n.id = ci.person_id
     JOIN role_type AS rt ON rt.id = ci.role_id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('f')
       AND rt.role IN ('actress'));