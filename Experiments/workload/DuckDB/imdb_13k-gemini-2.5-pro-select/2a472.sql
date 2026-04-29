WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1950 AND 1990
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv series',
                   'video movie')))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Australia',
                    'Czechoslovakia')
  AND mi2.info IN ('Black and White')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actress',
                   'miscellaneous crew'))
  AND (n.gender IN ('f')
       OR n.gender IS NULL);