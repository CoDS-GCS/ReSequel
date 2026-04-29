 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
     AND t.production_year BETWEEN 1975 AND 2015),
     filtered_ci AS
  (SELECT ci.movie_id
   FROM cast_info AS ci
   JOIN name AS n ON ci.person_id = n.id
   AND n.gender IS NULL
   JOIN role_type AS rt ON ci.role_id = rt.id
   AND rt.role IN ('editor',
                   'producer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN filtered_ci AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('1')
AND mi1.info IN ('101',
                    '103',
                    '30',
                    '56',
                    '78',
                    '82',
                    'UK:50',
                    'UK:90',
                    'USA:19',
                    'USA:88',
                    'USA:95')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('4')
AND mi2.info IN ('English',
                    'Spanish');