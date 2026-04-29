
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1950 AND 1990
  AND EXISTS
    (SELECT 1
     FROM kind_type AS kt
     WHERE kt.id = t.kind_id
       AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND EXISTS
    (SELECT 1
     FROM keyword k
     JOIN movie_keyword mk ON k.id = mk.keyword_id
     WHERE mk.movie_id = t.id
       AND k.keyword IN ('castration-threat',
                     'm-8-greyhound'))
  AND EXISTS
    (SELECT 1
     FROM company_name cn
     JOIN movie_companies mc ON cn.id = mc.company_id
     JOIN company_type ct ON mc.company_type_id = ct.id
     WHERE mc.movie_id = t.id
       AND cn.country_code IN ('[br]',
                           '[hu]',
                           '[nl]')
       AND ct.kind IN ('distributors',
                   'production companies'))
  AND EXISTS
    (SELECT 1
     FROM name n
     JOIN cast_info ci ON n.id = ci.person_id
     JOIN role_type rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('m')
       AND rt.role IN ('director'));