WITH filtered_t_mi AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   JOIN movie_info AS mi1 ON t.id = mi1.movie_id
   AND mi1.info_type_id IN ('16')
   AND mi1.info IN ('USA:2002',
                    'USA:2003',
                    'USA:2004',
                    'USA:2005',
                    'USA:2007',
                    'USA:2008',
                    'USA:2013')
   JOIN movie_info AS mi2 ON t.id = mi2.movie_id
   AND mi2.info_type_id IN ('2')
   AND mi2.info IN ('Color')
   WHERE kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
     AND t.production_year BETWEEN 1925 AND 2015)
SELECT COUNT(*)
FROM filtered_t_mi
JOIN cast_info AS ci ON filtered_t_mi.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON filtered_t_mi.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE rt.role IN ('director')
  AND n.gender IS NULL;