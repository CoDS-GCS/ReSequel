WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info_type_id IN ('2')
   AND mi1.info IN ('Color')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   AND mi2.info_type_id IN ('105')
   AND mi2.info IN ('$1,500',
                    '$100',
                    '$100,000',
                    '$15,000',
                    '$150,000',
                    '$2,000',
                    '$200,000',
                    '$25,000',
                    '$250,000',
                    '$30,000',
                    '$50,000',
                    '$500')
   WHERE kt.kind IN ('episode',
                   'movie',
                   'video movie')
     AND t.production_year BETWEEN 1990 AND 2015)
SELECT COUNT(*)
FROM filtered_t_mi
JOIN cast_info AS ci ON filtered_t_mi.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON filtered_t_mi.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE rt.role IN ('producer')
  AND n.gender IS NULL;