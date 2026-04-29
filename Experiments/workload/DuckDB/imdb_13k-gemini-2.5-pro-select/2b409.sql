
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('based-on-novel',
                     'blood',
                     'dancing',
                     'flashback',
                     'jealousy',
                     'kidnapping',
                     'love',
                     'new-york-city',
                     'one-word-title',
                     'oral-sex',
                     'singer',
                     'singing')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('5')
  AND mi1.info IN ('Brazil:12',
                    'Canada:18A',
                    'Finland:S',
                    'Germany:16',
                    'Iceland:L',
                    'Italy:T',
                    'Malaysia:U',
                    'Portugal:M/12',
                    'Portugal:M/6',
                    'USA:R')
  AND it2.id IN ('8')
  AND mi2.info IN ('Germany',
                    'UK',
                    'USA')
  AND rt.role IN ('director',
                   'editor')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);