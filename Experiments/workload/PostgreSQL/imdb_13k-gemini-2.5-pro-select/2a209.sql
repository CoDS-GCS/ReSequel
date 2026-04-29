 
 WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE kt.kind IN ('video game',
                   'video movie')
     AND t.production_year BETWEEN 1950 AND 1990)
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IS NULL
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('director')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('7')
AND mi1.info IN ('OFM:16 mm',
                    'PFM:35 mm',
                    'RAT:1.85 : 1')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('2')
AND mi2.info IN ('Color');