WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('2')
  AND mi1.info IN ('Color')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('20th Century Fox Studios - 10201 Pico Blvd., Century City, Los Angeles, California, USA',
                    'Berlin, Germany',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Mexico',
                    'Montréal, Québec, Canada',
                    'New York, USA',
                    'Rome, Lazio, Italy')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actor',
                   'producer')
  AND k.keyword IN ('bare-breasts',
                     'bare-chested-male',
                     'female-frontal-nudity',
                     'friendship',
                     'homosexual',
                     'hospital',
                     'husband-wife-relationship',
                     'love',
                     'male-frontal-nudity',
                     'non-fiction',
                     'nudity',
                     'number-in-title',
                     'one-word-title',
                     'sex');