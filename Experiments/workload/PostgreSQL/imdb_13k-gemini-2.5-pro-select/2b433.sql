
SELECT COUNT(*)
FROM
  (SELECT mk.movie_id
   FROM keyword AS k
   JOIN movie_keyword AS mk ON k.id = mk.keyword_id
   WHERE k.keyword IN ('bowser',
                     'dropping-anchor',
                     'limelight',
                     'olympic-committee',
                     'reference-to-niels-bohr',
                     'roach-clip',
                     'spirit-sound-activity',
                     'woman-punches-man')) AS filtered_mk
JOIN title AS t ON filtered_mk.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('movie',
                   'video movie')
  AND it1.id IN ('18')
  AND mi1.info IN ('London, England, UK',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA')
  AND it2.id IN ('5')
  AND mi2.info IN ('Australia:M',
                    'Germany:16',
                    'Iceland:16',
                    'Netherlands:12',
                    'Netherlands:16',
                    'Portugal:M/12',
                    'UK:15',
                    'USA:Not Rated',
                    'USA:TV-14')
  AND rt.role IN ('director',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);