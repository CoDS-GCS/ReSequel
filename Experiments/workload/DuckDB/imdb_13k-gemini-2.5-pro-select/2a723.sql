
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'video movie')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IN ('m')
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('miscellaneous crew')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('3')
AND mi1.info IN ('Action',
                    'Adventure',
                    'Comedy',
                    'Drama',
                    'Family',
                    'Romance',
                    'Thriller')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('5')
AND mi2.info IN ('Argentina:13',
                    'Argentina:16',
                    'Canada:G',
                    'Hong Kong:IIA',
                    'Iceland:12',
                    'New Zealand:M',
                    'Singapore:PG',
                    'Sweden:11',
                    'Sweden:7',
                    'Switzerland:7',
                    'USA:Approved',
                    'USA:TV-G')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015;