WITH movie_base AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1990 AND 2015
     AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')),
     movie_keywords AS
  (SELECT mk.movie_id
   FROM movie_keyword AS mk
   JOIN keyword AS k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('anal-sex',
                     'bare-chested-male',
                     'blood',
                     'fight',
                     'gun',
                     'jealousy',
                     'lesbian',
                     'male-nudity',
                     'mother-son-relationship',
                     'sequel',
                     'singer',
                     'singing',
                     'surrealism'))
SELECT COUNT(*)
FROM movie_base
JOIN movie_keywords ON movie_base.id = movie_keywords.movie_id
JOIN movie_info AS mi1 ON movie_base.id = mi1.movie_id
JOIN movie_info AS mi2 ON movie_base.id = mi2.movie_id
JOIN cast_info AS ci ON movie_base.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,500',
                    '$10,000',
                    '$15,000',
                    '$500')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Short')
  AND rt.role IN ('miscellaneous crew',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL);