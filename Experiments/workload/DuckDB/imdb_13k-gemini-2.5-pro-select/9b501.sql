
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE ci.movie_id IN
    (SELECT t.id
     FROM title AS t
     JOIN kind_type AS kt ON t.kind_id = kt.id
     WHERE t.production_year BETWEEN 1875 AND 1975
       AND kt.kind IN ('tv series'))
  AND ci.person_id IN
    (SELECT pi.person_id
     FROM person_info AS pi
     JOIN info_type AS it2 ON pi.info_type_id = it2.id
     WHERE it2.id IN ('33'))
  AND n.name ILIKE '%pa%'
  AND rt.role IN ('costume designer',
                   'director',
                   'producer')
  AND it1.id IN ('2',
                  '4',
                  '5')
  AND mi1.info IN ('Australia:PG',
                    'Black and White',
                    'Color',
                    'French',
                    'Portuguese',
                    'Spanish',
                    'USA:TV-14')
GROUP BY mi1.info,
         n.name;