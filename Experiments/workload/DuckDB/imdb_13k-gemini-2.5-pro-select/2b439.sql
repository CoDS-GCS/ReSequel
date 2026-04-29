
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv series',
                   'video movie')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
AND k.keyword IN ('anal-sex',
                     'bare-chested-male',
                     'blood',
                     'character-name-in-title',
                     'cigarette-smoking',
                     'female-nudity',
                     'fight',
                     'friendship',
                     'gun',
                     'hospital',
                     'interview',
                     'love',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'non-fiction',
                     'one-word-title',
                     'revenge',
                     'violence')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
AND it1.id IN ('5')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
AND it2.id IN ('2')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'production designer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Australia:M',
                    'Canada:G',
                    'Finland:K-12',
                    'Iceland:16',
                    'India:U',
                    'UK:18',
                    'UK:PG',
                    'UK:X',
                    'USA:G',
                    'USA:PG',
                    'USA:Passed',
                    'USA:Unrated',
                    'USA:X')
  AND mi2.info IN ('Black and White',
                    'Color');