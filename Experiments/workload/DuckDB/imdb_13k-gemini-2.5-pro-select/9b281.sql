
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
     WHERE t.production_year BETWEEN 1925 AND 1975
       AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND ci.person_id IN
    (SELECT pi.person_id
     FROM person_info AS pi
     JOIN info_type AS it2 ON pi.info_type_id = it2.id
     WHERE it2.id IN ('22'))
  AND n.name ILIKE '%an%'
  AND rt.role IN ('cinematographer',
                   'editor',
                   'writer')
  AND it1.id IN ('4',
                  '5',
                  '8')
  AND mi1.info IN ('American Sign Language',
                    'Armenian',
                    'Belgium:Tous',
                    'Brazil:Livre',
                    'Finland:K-12',
                    'Georgia',
                    'Georgian',
                    'Germany:o.Al.',
                    'Iceland:12',
                    'Ireland',
                    'Macedonian',
                    'Norway:16',
                    'Romanian',
                    'Serbian',
                    'Sweden:11',
                    'Sweden:15',
                    'USA:TV-Y7',
                    'West Germany:18')
GROUP BY mi1.info,
         n.name;