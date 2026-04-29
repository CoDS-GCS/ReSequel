WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'video movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('anal-sex',
                     'bare-chested-male',
                     'blood',
                     'cigarette-smoking',
                     'dancing',
                     'doctor',
                     'gay',
                     'lesbian',
                     'male-nudity',
                     'oral-sex',
                     'police',
                     'song')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
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
WHERE t.production_year BETWEEN 1990 AND 2015
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('English')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Canada:18A',
                    'New Zealand:R18',
                    'Singapore:PG13',
                    'UK:E',
                    'USA:T');