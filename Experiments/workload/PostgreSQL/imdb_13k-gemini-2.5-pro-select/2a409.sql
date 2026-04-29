 
 WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv series',
                   'video game',
                   'video movie')))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('1')
  AND mi1.info IN ('English',
                    'Spanish')
  AND mi2.info IN ('51',
                    '8',
                    '80',
                    '90',
                    'USA:20')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'producer'))
  AND (n.gender IN ('f')
       OR n.gender IS NULL);