
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM title AS t
INNER JOIN kind_type AS kt ON t.kind_id = kt.id
INNER JOIN movie_info AS mi1 ON t.id = mi1.movie_id
INNER JOIN info_type AS it1 ON mi1.info_type_id = it1.id
INNER JOIN cast_info AS ci ON t.id = ci.movie_id
INNER JOIN role_type AS rt ON ci.role_id = rt.id
INNER JOIN name AS n ON ci.person_id = n.id
INNER JOIN person_info AS pi ON n.id = pi.person_id
INNER JOIN info_type AS it2 ON pi.info_type_id = it2.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:R',
                    'Brazil:14',
                    'Brazil:Livre',
                    'Canada:18A',
                    'Finland:K-12',
                    'Germany:18',
                    'Germany:6',
                    'Hong Kong:IIB',
                    'India:U',
                    'Ireland:15A',
                    'New Zealand:R16',
                    'Norway:11',
                    'Peru:14',
                    'Spain:T',
                    'Switzerland:10',
                    'Switzerland:7',
                    'UK:12A',
                    'USA:Not Rated')
  AND rt.role IN ('actor',
                   'actress',
                   'composer',
                   'costume designer')
  AND n.name ILIKE '%py%'
  AND it2.id IN ('34')
GROUP BY mi1.info,
         n.name;