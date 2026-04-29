WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('fall-on-floor',
                     'hooded-criminal',
                     'man-bitten-by-a-dog',
                     'pony',
                     'sandfish',
                     'tv-atlas'))
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
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:M',
                    'Finland:K-11',
                    'Finland:S',
                    'France:U',
                    'Hong Kong:IIB',
                    'India:A',
                    'Ireland:15A',
                    'New Zealand:R18',
                    'Singapore:PG',
                    'USA:Approved',
                    'USA:R',
                    'West Germany:6')
  AND it2.id IN ('8')
  AND mi2.info IN ('France',
                    'Germany',
                    'Hong Kong',
                    'India',
                    'UK',
                    'USA',
                    'West Germany')
  AND rt.role IN ('director')
  AND n.gender IN ('m');