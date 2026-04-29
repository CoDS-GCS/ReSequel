
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
       AND it2.id IN ('20'))
  AND EXISTS
    (SELECT 1
     FROM role_type rt
     WHERE rt.id = ci.role_id
       AND rt.role IN ('miscellaneous crew',
                   'producer',
                   'production designer'))
  AND mi1.info_type_id IN ('4',
                  '5')
  AND n.name ILIKE '%monti%'
  AND mi1.info IN ('Argentina:Atp',
                    'Canada:PG',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:16',
                    'Portuguese',
                    'Singapore:PG',
                    'Spain:13',
                    'Spain:18',
                    'UK:18',
                    'USA:PG-13')
GROUP BY mi1.info,
         n.name;