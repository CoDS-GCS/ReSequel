WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Short')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Czech Republic',
                    'East Germany')
  AND n.gender IN ('m')
  AND rt.role IN ('director')
  AND k.keyword IN ('based-on-play',
                     'blood',
                     'dog',
                     'female-frontal-nudity',
                     'fight',
                     'friendship',
                     'hospital',
                     'interview',
                     'male-frontal-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'non-fiction',
                     'police',
                     'singing',
                     'violence');