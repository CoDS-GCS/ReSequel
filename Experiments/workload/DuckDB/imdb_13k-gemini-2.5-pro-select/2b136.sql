WITH t_mk AS
  (SELECT t.id
   FROM title AS t
   JOIN movie_keyword AS mk ON t.id = mk.movie_id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv series',
                   'video game',
                   'video movie'))
     AND mk.keyword_id IN
       (SELECT id
        FROM keyword
        WHERE keyword IN ('father-son-relationship',
                     'gun',
                     'lesbian-sex',
                     'mother-daughter-relationship',
                     'mother-son-relationship',
                     'party',
                     'suicide',
                     'violence')))
SELECT COUNT(*)
FROM t_mk
JOIN movie_info AS mi1 ON t_mk.id = mi1.movie_id
JOIN movie_info AS mi2 ON t_mk.id = mi2.movie_id
JOIN cast_info AS ci ON t_mk.id = ci.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi1.info IN ('English',
                    'Spanish')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('58',
                    '80',
                    '85',
                    '90',
                    'Argentina:30',
                    'USA:50')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('producer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m')
       OR gender IS NULL);