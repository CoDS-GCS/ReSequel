
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND mi1.info IN ('France',
                    'Germany',
                    'USA',
                    'West Germany')
  AND mi2.info IN ('Argentina:13',
                    'Canada:AA',
                    'France:X',
                    'Italy:T',
                    'Switzerland:10',
                    'USA:E',
                    'West Germany:18')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('5')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('blood',
                     'dancing',
                     'death',
                     'father-son-relationship',
                     'female-nudity',
                     'fight',
                     'hardcore',
                     'independent-film',
                     'kidnapping',
                     'love',
                     'male-frontal-nudity',
                     'male-nudity',
                     'mother-daughter-relationship',
                     'new-york-city',
                     'one-word-title',
                     'party',
                     'singer',
                     'suicide'));