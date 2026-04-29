 
 
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON 1=1
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
WHERE it1.id IN ('3')
  AND it2.id IN ('4')
  AND mi1.info IN ('Action',
                    'Comedy',
                    'Crime',
                    'Drama')
  AND mi2.info IN ('French',
                    'Hindi',
                    'Japanese',
                    'Mandarin')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie')
  AND rt.role IN ('writer')
  AND n.gender IS NULL
  AND t.production_year BETWEEN 1925 AND 1975;