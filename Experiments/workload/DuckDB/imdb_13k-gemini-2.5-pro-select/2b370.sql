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
   WHERE k.keyword IN ('based-on-novel',
                     'dog',
                     'family-relationships',
                     'fight',
                     'gay',
                     'gun',
                     'hardcore',
                     'homosexual',
                     'independent-film',
                     'interview',
                     'marriage',
                     'non-fiction',
                     'oral-sex',
                     'song',
                     'suicide'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('100',
                    '25',
                    '8',
                    '82',
                    '85',
                    '93')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Mono')
  AND rt.role IN ('producer')
  AND (n.gender IN ('f')
       OR n.gender IS NULL);