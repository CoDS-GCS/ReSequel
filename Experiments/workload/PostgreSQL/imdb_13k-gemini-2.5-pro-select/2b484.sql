
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('based-on-novel',
                     'death',
                     'doctor',
                     'dog',
                     'father-daughter-relationship',
                     'female-frontal-nudity',
                     'flashback',
                     'gay',
                     'gun',
                     'hardcore',
                     'homosexual',
                     'interview',
                     'kidnapping',
                     'lesbian',
                     'male-frontal-nudity',
                     'marriage',
                     'party',
                     'police',
                     'revenge',
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Mexico',
                    'New York City, New York, USA')
  AND it2.id IN ('3')
  AND mi2.info IN ('Drama',
                    'Short',
                    'Western')
  AND rt.role IN ('editor',
                   'miscellaneous crew')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);