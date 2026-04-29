
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM cast_info AS ci
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
AND it2.id IN ('22')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'cinematographer',
                   'composer',
                   'costume designer')
JOIN title AS t ON ci.movie_id = t.id
AND t.production_year BETWEEN 1925 AND 2015
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
JOIN movie_info AS mi1 ON ci.movie_id = mi1.movie_id
AND mi1.info IN ('Australia:MA',
                    'Brazil:12',
                    'Canada:13+',
                    'Canada:R',
                    'Finland:K-12',
                    'Germany:12',
                    'Germany:6',
                    'Hong Kong:IIB',
                    'Iceland:L',
                    'Netherlands:AL',
                    'Portugal:M/16',
                    'Portugal:M/6',
                    'South Korea:12',
                    'South Korea:18',
                    'Switzerland:10',
                    'Switzerland:7',
                    'UK:15',
                    'USA:PG',
                    'USA:TV-G',
                    'USA:Unrated')
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('5')
WHERE n.name ILIKE '%alb%'
GROUP BY mi1.info,
         n.name;