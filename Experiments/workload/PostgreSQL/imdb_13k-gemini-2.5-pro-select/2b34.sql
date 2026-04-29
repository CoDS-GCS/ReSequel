WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 2015
     AND kt.kind IN ('tv movie',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('8')
  AND mi1.info IN ('USA')
  AND mi2.info_type_id IN ('16')
  AND mi2.info IN ('USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2006',
                    'USA:2007',
                    'USA:2008',
                    'USA:2009',
                    'USA:2010',
                    'USA:2012')
  AND n.gender IN ('m')
  AND rt.role IN ('cinematographer')
  AND k.keyword IN ('father-daughter-relationship',
                     'gay',
                     'homosexual',
                     'mother-daughter-relationship',
                     'non-fiction',
                     'surrealism',
                     'violence');