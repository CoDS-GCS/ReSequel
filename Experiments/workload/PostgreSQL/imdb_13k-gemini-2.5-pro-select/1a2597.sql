 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'tv series',
                   'video game')
  AND it1.id IN ('3')
  AND mi1.info IN ('Drama',
                    'Fantasy',
                    'Mystery',
                    'Sport',
                    'Thriller')
  AND it2.id IN ('1')
  AND mi2.info IN ('130',
                    '25',
                    '32',
                    '78',
                    '82',
                    '87',
                    'Canada:4',
                    'USA:80',
                    'USA:97')
  AND rt.role IN ('composer',
                   'miscellaneous crew',
                   'production designer',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);