
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
     movie_keyword AS mk
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.id = mk.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND t.production_year <= 2015
  AND t.production_year >= 1975
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND rt.role IN ('miscellaneous crew')
  AND n.gender IN ('f')
  AND it1.id IN ('5')
  AND mi1.info IN ('Argentina:13',
                    'Argentina:Atp',
                    'Australia:M',
                    'Canada:14A',
                    'Germany:12',
                    'Germany:6',
                    'Iceland:16',
                    'Netherlands:12',
                    'Portugal:M/12',
                    'Singapore:PG',
                    'Switzerland:14',
                    'UK:15',
                    'USA:PG')
  AND it2.id IN ('6')
  AND mi2.info IN ('DTS',
                    'Dolby Digital',
                    'Dolby',
                    'Stereo');