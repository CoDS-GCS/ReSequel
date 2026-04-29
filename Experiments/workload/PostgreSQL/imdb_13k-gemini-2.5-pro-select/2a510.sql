 
 
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
WHERE t.production_year <= 1975
  AND t.production_year >= 1875
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND t.kind_id = kt.id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND it1.id IN ('6')
  AND mi1.info IN ('Mono',
                    'Silent')
  AND mi2.info_type_id = it2.id
  AND it2.id IN ('5')
  AND mi2.info IN ('Argentina:16',
                    'Canada:G',
                    'Finland:(Banned)',
                    'Finland:K-12',
                    'Iceland:16',
                    'India:U',
                    'Singapore:PG',
                    'Sweden:11',
                    'UK:18',
                    'USA:PG',
                    'USA:Passed',
                    'USA:TV-PG')
  AND ci.role_id = rt.id
  AND rt.role IN ('producer')
  AND ci.person_id = n.id
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND mk.keyword_id = k.id
  AND mi1.movie_id = mi2.movie_id;