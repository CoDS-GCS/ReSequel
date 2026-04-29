
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
     WHERE t.production_year BETWEEN 1950 AND 1990
       AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
  AND ci.person_id IN
    (SELECT pi.person_id
     FROM person_info AS pi
     JOIN info_type AS it2 ON pi.info_type_id = it2.id
     WHERE it2.id IN ('33'))
  AND n.name ILIKE '%he%'
  AND rt.role IN ('cinematographer',
                   'composer',
                   'production designer',
                   'writer')
  AND it1.id IN ('8')
  AND mi1.info IN ('Albania',
                    'Colombia',
                    'Estonia',
                    'Germany',
                    'Hungary',
                    'Luxembourg',
                    'New Zealand',
                    'South Africa',
                    'Sri Lanka',
                    'Thailand',
                    'Tunisia')
GROUP BY mi1.info,
         n.name;