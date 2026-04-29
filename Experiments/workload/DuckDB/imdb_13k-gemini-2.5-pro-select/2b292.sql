WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('father-son-relationship',
                     'female-frontal-nudity',
                     'hardcore',
                     'lesbian',
                     'male-frontal-nudity',
                     'male-nudity',
                     'non-fiction',
                     'party',
                     'tv-mini-series'))
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
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('1')
  AND mi1.info IN ('13',
                    '15',
                    '16',
                    '30',
                    '45',
                    '5',
                    '6',
                    '60',
                    '7',
                    '8',
                    '88',
                    '90',
                    '93',
                    '98',
                    'USA:11')
  AND it2.id IN ('3')
  AND mi2.info IN ('Animation',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Short')
  AND rt.role IN ('cinematographer')
  AND n.gender IN ('m');