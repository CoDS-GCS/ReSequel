
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
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('16')
  AND mi1.info IN ('USA:1994',
                    'USA:1995',
                    'USA:2001',
                    'USA:2002',
                    'USA:2004',
                    'USA:2006',
                    'USA:August 2010',
                    'USA:August 2011',
                    'USA:October 2007')
  AND it2.id IN ('1')
  AND mi2.info IN ('110',
                    '119',
                    '27',
                    '40',
                    '53',
                    '69',
                    '84',
                    'UK:120',
                    'USA:101',
                    'USA:109',
                    'USA:12',
                    'USA:3',
                    'USA:70')
  AND n.gender IS NULL
  AND rt.role IN ('cinematographer',
                   'costume designer',
                   'producer',
                   'writer');