
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON k.id = mk.keyword_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('3')
AND mi1.info IN ('Action',
                    'Animation',
                    'Biography',
                    'Documentary',
                    'Drama',
                    'History',
                    'Romance',
                    'Sci-Fi',
                    'Short')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('8')
AND mi2.info IN ('Canada',
                    'France',
                    'Hong Kong',
                    'Ireland',
                    'Italy',
                    'Mexico',
                    'Philippines',
                    'UK',
                    'USA')
WHERE t.production_year BETWEEN 1975 AND 2015
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND n.gender IS NULL
  AND rt.role IN ('editor');