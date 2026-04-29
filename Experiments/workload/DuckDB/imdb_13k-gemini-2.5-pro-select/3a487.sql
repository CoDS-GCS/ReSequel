
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1875 AND 1975
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
       AND k.keyword IN ('collaborative-filmmaking',
                     'corpse-in-a-coffin',
                     'escape-jail',
                     'ghost-train',
                     'head-caught-in-venetian-blinds',
                     'japanese-citizens',
                     'lambada',
                     'lost-lease',
                     'reference-to-tom-hayden',
                     'spear-thrower',
                     'under-tipping',
                     'wolf-boy',
                     'worst-case-scenario'))
  AND EXISTS
    (SELECT 1
     FROM company_name cn
     JOIN movie_companies mc ON cn.id = mc.company_id
     JOIN company_type ct ON mc.company_type_id = ct.id
     WHERE mc.movie_id = t.id
       AND cn.country_code IN ('[au]',
                           '[nl]',
                           '[ph]',
                           '[ru]')
       AND ct.kind IN ('distributors',
                   'production companies'))
  AND EXISTS
    (SELECT 1
     FROM name n
     JOIN cast_info ci ON n.id = ci.person_id
     JOIN role_type rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND n.gender IN ('m')
       AND rt.role IN ('editor'));