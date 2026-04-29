
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM kind_type AS kt
JOIN title AS t ON kt.id = t.kind_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE kt.kind IN ('episode',
                   'video movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND it1.id IN ('4',
                  '5',
                  '8')
  AND mi1.info IN ('Argentina',
                    'Argentina:Atp',
                    'Australia:R',
                    'Canada:G',
                    'Denmark',
                    'Finland',
                    'Finnish',
                    'France',
                    'Greek',
                    'Japanese',
                    'Nigeria',
                    'Russia',
                    'South Africa',
                    'Spain:18',
                    'USA:PG',
                    'USA:TV-PG')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'writer')
  AND n.name ILIKE '%la%'
  AND it2.id IN ('20')
GROUP BY mi1.info,
         n.name;