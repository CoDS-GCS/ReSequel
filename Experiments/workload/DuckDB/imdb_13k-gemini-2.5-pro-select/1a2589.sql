WITH filtered_titles AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM filtered_titles ft
JOIN cast_info AS ci ON ft.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_info AS mi1 ON ft.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON ft.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE rt.role IN ('actress',
                   'editor',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('1')
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
  AND it2.id IN ('3')
  AND mi2.info IN ('Action',
                    'Animation',
                    'Crime',
                    'Documentary',
                    'Family',
                    'Horror',
                    'Reality-TV',
                    'Short',
                    'Sport');