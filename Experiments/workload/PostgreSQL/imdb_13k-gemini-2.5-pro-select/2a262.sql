 
 
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN cast_info AS ci ON mi1.movie_id = ci.movie_id
JOIN title AS t ON mi1.movie_id = t.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND it1.id IN ('16')
  AND it2.id IN ('4')
  AND mi1.info IN ('USA:2002',
                    'USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2006',
                    'USA:2007',
                    'USA:2008',
                    'USA:2009',
                    'USA:2010',
                    'USA:2013')
  AND mi2.info IN ('English')
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND rt.role IN ('composer',
                   'editor')
  AND n.gender IS NULL;