
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
AND n.gender IS NULL
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('composer',
                   'miscellaneous crew')
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('3')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('8')
WHERE t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('Action',
                    'Comedy',
                    'Documentary',
                    'Drama',
                    'Horror',
                    'Short',
                    'Thriller',
                    'War')
  AND mi2.info IN ('Chile',
                    'East Germany',
                    'France',
                    'Japan',
                    'New Zealand',
                    'Russia',
                    'Spain',
                    'Switzerland',
                    'UK');