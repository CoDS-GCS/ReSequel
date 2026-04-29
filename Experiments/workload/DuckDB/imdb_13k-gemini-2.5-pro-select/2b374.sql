
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE n.gender IS NULL
  AND rt.role IN ('production designer')
  AND t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('tv series',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'New York City, New York, USA')
  AND it2.id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Documentary',
                    'Drama')
  AND k.keyword IN ('bare-breasts',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'female-nudity',
                     'friendship',
                     'hardcore',
                     'independent-film',
                     'interview',
                     'love',
                     'male-frontal-nudity',
                     'mother-daughter-relationship',
                     'murder',
                     'party',
                     'sex',
                     'singer');