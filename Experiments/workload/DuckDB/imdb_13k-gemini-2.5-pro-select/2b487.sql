
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('8')
  AND mi1.info IN ('China',
                    'Egypt',
                    'Hong Kong',
                    'India',
                    'Philippines',
                    'Serbia',
                    'South Africa',
                    'Spain',
                    'Switzerland',
                    'USA',
                    'Venezuela')
  AND it2.id IN ('4')
  AND mi2.info IN ('Arabic',
                    'English',
                    'Galician',
                    'Italian',
                    'Japanese',
                    'Mandarin',
                    'None',
                    'Serbian',
                    'Spanish',
                    'Swiss German',
                    'Tamil')
  AND rt.role IN ('producer')
  AND n.gender IS NULL
  AND k.keyword IN ('character-name-in-title',
                     'father-daughter-relationship',
                     'flashback',
                     'friendship',
                     'independent-film',
                     'mother-daughter-relationship',
                     'murder',
                     'new-york-city',
                     'number-in-title',
                     'police',
                     'sequel',
                     'singing',
                     'suicide');