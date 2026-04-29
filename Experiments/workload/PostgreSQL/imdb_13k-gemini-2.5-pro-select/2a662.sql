 
 
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n,
     movie_keyword AS mk,
     keyword AS k
WHERE t.production_year <= 2015
  AND t.production_year >= 1990
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND t.kind_id = kt.id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND it1.id IN ('16')
  AND mi1.info IN ('USA:2002',
                    'USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2010',
                    'USA:2011',
                    'USA:2012',
                    'USA:2013')
  AND mi2.info_type_id = it2.id
  AND it2.id IN ('8')
  AND mi2.info IN ('USA')
  AND ci.role_id = rt.id
  AND rt.role IN ('costume designer',
                   'editor')
  AND ci.person_id = n.id
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND mk.keyword_id = k.id
  AND mi1.movie_id = mi2.movie_id;