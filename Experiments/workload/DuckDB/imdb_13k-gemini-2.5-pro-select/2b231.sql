WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('blood',
                     'character-name-in-title',
                     'doctor',
                     'father-daughter-relationship',
                     'father-son-relationship',
                     'fight',
                     'flashback',
                     'friendship',
                     'gay',
                     'hardcore',
                     'husband-wife-relationship',
                     'independent-film',
                     'kidnapping',
                     'lesbian',
                     'mother-daughter-relationship',
                     'number-in-title',
                     'oral-sex',
                     'party',
                     'sequel',
                     'singing',
                     'suicide'))
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
  AND kt.kind IN ('tv movie',
                   'tv series')
  AND it1.id IN ('18')
  AND mi1.info IN ('Berlin, Germany',
                    'Chicago, Illinois, USA',
                    'Hollywood, Los Angeles, California, USA',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Mexico City, Distrito Federal, Mexico',
                    'New York City, New York, USA',
                    'Rome, Lazio, Italy',
                    'San Francisco, California, USA',
                    'Vancouver, British Columbia, Canada')
  AND it2.id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Drama',
                    'Music',
                    'Romance',
                    'Short')
  AND rt.role IN ('cinematographer',
                   'costume designer')
  AND n.gender IN ('f');