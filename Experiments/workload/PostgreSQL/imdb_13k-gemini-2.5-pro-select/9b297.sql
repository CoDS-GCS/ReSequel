
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
WHERE EXISTS
    (SELECT 1
     FROM title t
     JOIN kind_type kt ON t.kind_id = kt.id
     WHERE t.id = ci.movie_id
       AND t.production_year BETWEEN 1925 AND 2015
       AND kt.kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND EXISTS
    (SELECT 1
     FROM person_info pi
     JOIN info_type it2 ON pi.info_type_id = it2.id
     WHERE pi.person_id = ci.person_id
       AND it2.id IN ('29'))
  AND EXISTS
    (SELECT 1
     FROM role_type rt
     WHERE rt.id = ci.role_id
       AND rt.role IN ('actor',
                   'actress',
                   'costume designer'))
  AND mi1.info_type_id IN ('2',
                  '5',
                  '6')
  AND n.name ILIKE '%bamb%'
  AND mi1.info IN ('Australia:M',
                    'Dolby',
                    'Netherlands:12',
                    'UK:15',
                    'USA:TV-PG')
GROUP BY mi1.info,
         n.name;