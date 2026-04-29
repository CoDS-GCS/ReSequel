WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'tv movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('blood',
                     'death',
                     'doctor',
                     'female-frontal-nudity',
                     'gay',
                     'mother-daughter-relationship',
                     'murder',
                     'non-fiction',
                     'number-in-title',
                     'police',
                     'sequel',
                     'singing')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('producer',
                   'writer')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL)
SELECT COUNT(*)
FROM title AS t
JOIN filtered_kt ON t.kind_id = filtered_kt.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN filtered_k ON mk.keyword_id = filtered_k.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_rt ON ci.role_id = filtered_rt.id
JOIN filtered_n ON ci.person_id = filtered_n.id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('USA:Approved')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA');