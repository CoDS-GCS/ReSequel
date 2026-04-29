 
 WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info_type_id IN ('8')
   AND mi1.info IN ('Portugal',
                    'Spain',
                    'Turkey',
                    'UK',
                    'USA',
                    'West Germany')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   AND mi2.info_type_id IN ('3')
   AND mi2.info IN ('Adventure',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Mystery',
                    'Short')
   WHERE kt.kind IN ('tv series',
                   'video game',
                   'video movie')
     AND t.production_year BETWEEN 1875 AND 1975)
SELECT COUNT(*)
FROM filtered_t_mi
JOIN cast_info AS ci ON filtered_t_mi.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON filtered_t_mi.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE rt.role IN ('costume designer')
  AND n.gender IS NULL;