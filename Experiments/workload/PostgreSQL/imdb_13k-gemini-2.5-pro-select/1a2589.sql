 
 
SELECT COUNT(*)
FROM title AS t,
     kind_type AS kt,
     info_type AS it1,
     movie_info AS mi1,
     movie_info AS mi2,
     info_type AS it2,
     cast_info AS ci,
     role_type AS rt,
     name AS n
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND mi1.info_type_id = it1.id
  AND mi2.info_type_id = it2.id
  AND it1.id IN ('1')
  AND it2.id IN ('3')
  AND t.kind_id = kt.id
  AND ci.person_id = n.id
  AND ci.role_id = rt.id
  AND mi1.info IN ('105',
                    '31',
                    '43',
                    '78',
                    '84',
                    'USA:13',
                    'USA:14',
                    'USA:16',
                    'USA:86',
                    'USA:92',
                    'USA:99')
  AND mi2.info IN ('Action',
                    'Animation',
                    'Crime',
                    'Documentary',
                    'Family',
                    'Horror',
                    'Reality-TV',
                    'Short',
                    'Sport')
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND t.production_year BETWEEN 1975 AND 2015;