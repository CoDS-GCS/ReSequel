
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
AND it2.id IN ('29')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1975 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
AND mi1.info IN ('70 mm 6-Track',
                    'Austria',
                    'Bolivia',
                    'Chile',
                    'China',
                    'DTS-ES',
                    'Datasat',
                    'Dominican Republic',
                    'East Germany',
                    'Ecuador',
                    'Hong Kong',
                    'India',
                    'Luxembourg',
                    'Norway',
                    'Panama',
                    'Peru',
                    'Poland',
                    'Puerto Rico',
                    'Ultra Stereo')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('6',
                  '8')
WHERE n.name ILIKE '%carl%'
GROUP BY mi1.info,
         n.name;