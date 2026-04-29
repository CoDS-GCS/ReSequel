
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv series')
  AND rt.role IN ('cinematographer',
                   'composer',
                   'editor',
                   'writer')
  AND it1.id IN ('5',
                  '6',
                  '8')
  AND it2.id IN ('29')
  AND mi1.info IN ('6-Track Stereo',
                    'Argentina:X',
                    'Austria:16',
                    'Azerbaijan',
                    'Bahamas',
                    'Colombia:18',
                    'DTS 70 mm',
                    'Denmark:12',
                    'Dolby Stereo',
                    'Finland:K-6/4',
                    'Ireland:(Banned)',
                    'New Zealand:(Banned)',
                    'Peru',
                    'Poland:16',
                    'Romania:I.M.-18',
                    'Singapore:(Banned)',
                    'Spain:16',
                    'Switzerland:18',
                    'West Germany:0',
                    'West Germany:o.Al.')
  AND n.name ILIKE '%ha%'
GROUP BY mi1.info,
         n.name;