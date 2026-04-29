WITH t_filtered AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('tv movie',
                   'tv series',
                   'video game')))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE mi1.info_type_id IN ('2')
  AND mi2.info_type_id IN ('105')
  AND mi1.info IN ('Color')
  AND mi2.info IN ('$1,500',
                    '$100',
                    '$200',
                    '$200,000',
                    '$25,000',
                    '$250,000',
                    '$3,000',
                    '$30,000',
                    '$50,000',
                    '$500',
                    '$500,000')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('director',
                   'miscellaneous crew'))
  AND (n.gender IN ('m')
       OR n.gender IS NULL);