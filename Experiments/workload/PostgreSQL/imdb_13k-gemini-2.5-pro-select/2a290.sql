 
 WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'tv movie')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('cinematographer',
                   'writer')),
     filtered_it1 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('6')),
     filtered_it2 AS
  (SELECT id
   FROM info_type
   WHERE id IN ('3'))
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN filtered_it1 AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN filtered_it2 AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND n.gender IS NULL
  AND mi1.info IN ('Mono',
                    'Silent')
  AND mi2.info IN ('Action',
                    'Adventure',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Musical',
                    'Short',
                    'Western');