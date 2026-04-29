WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1975 AND 2015
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
WHERE mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,000,000',
                    '$2,000',
                    '$500')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('USA')
  AND n.gender IN ('m')
  AND rt.role IN ('producer')
  AND k.keyword IN ('anal-sex',
                     'character-name-in-title',
                     'family-relationships',
                     'father-son-relationship',
                     'female-nudity',
                     'flashback',
                     'friendship',
                     'hardcore',
                     'homosexual',
                     'husband-wife-relationship',
                     'interview',
                     'lesbian-sex',
                     'nudity',
                     'oral-sex',
                     'sex');