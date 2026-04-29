
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('3')
  AND mi2.info_type_id IN ('18')
  AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Music',
                    'Romance',
                    'Short',
                    'Thriller')
  AND mi2.info IN ('Berlin, Germany',
                    'Chicago, Illinois, USA',
                    'Hollywood, Los Angeles, California, USA',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Mexico',
                    'New York City, New York, USA',
                    'Paris, France',
                    'Toronto, Ontario, Canada',
                    'USA')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'production designer'))
  AND (n.gender IN ('f')
       OR n.gender IS NULL);