
SELECT mi1.info,
       n.name,
       COUNT(*)
FROM name AS n
JOIN person_info AS pi ON n.id = pi.person_id
JOIN info_type AS it2 ON pi.info_type_id = it2.id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
WHERE n.name ILIKE '%wa%'
  AND it2.id IN ('25')
  AND rt.role IN ('actress',
                   'costume designer',
                   'director',
                   'miscellaneous crew')
  AND t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('episode',
                   'video movie')
  AND it1.id IN ('2',
                  '3',
                  '4')
  AND mi1.info IN ('American Sign Language',
                    'Arabic',
                    'Cantonese',
                    'Chinese',
                    'Croatian',
                    'Finnish',
                    'Hebrew',
                    'Hindi',
                    'History',
                    'Italian',
                    'Korean',
                    'Mandarin',
                    'News',
                    'Polish',
                    'Reality-TV',
                    'Romance',
                    'Talk-Show',
                    'War',
                    'Western',
                    'Yoruba')
GROUP BY mi1.info,
         n.name;