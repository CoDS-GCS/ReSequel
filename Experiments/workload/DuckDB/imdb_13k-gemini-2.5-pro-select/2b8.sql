
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('bare-chested-male',
                     'based-on-play',
                     'love',
                     'new-york-city',
                     'non-fiction',
                     'oral-sex',
                     'violence')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('1')
  AND mi1.info IN ('100',
                    '22',
                    '30',
                    '60',
                    '90',
                    '95',
                    'Argentina:30',
                    'USA:30',
                    'USA:60')
  AND it2.id IN ('7')
  AND mi2.info IN ('OFM:35 mm',
                    'PFM:35 mm',
                    'RAT:1.33 : 1',
                    'RAT:1.78 : 1',
                    'RAT:1.85 : 1')
  AND rt.role IN ('director')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);