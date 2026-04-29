
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
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('CBS Studio Center - 4024 Radford Avenue, Studio City, Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Revue Studios, Hollywood, Los Angeles, California, USA')
  AND it2.id IN ('1')
  AND mi2.info IN ('30',
                    '60')
  AND rt.role IN ('cinematographer',
                   'costume designer')
  AND n.gender IN ('f',
                    'm')
  AND k.keyword IN ('dancing',
                     'male-frontal-nudity',
                     'mother-son-relationship',
                     'murder',
                     'non-fiction',
                     'police');