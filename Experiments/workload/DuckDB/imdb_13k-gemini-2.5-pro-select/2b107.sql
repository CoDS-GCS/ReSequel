WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('tv series',
                   'video game',
                   'video movie')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('character-name-in-title',
                     'father-son-relationship',
                     'husband-wife-relationship',
                     'lesbian',
                     'love',
                     'sex',
                     'surrealism'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('20',
                    '6',
                    '70',
                    '75',
                    'USA:20')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('English')
  AND rt.role IN ('producer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);