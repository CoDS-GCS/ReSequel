WITH filtered_kt AS
  (SELECT id
   FROM kind_type
   WHERE kind IN ('episode',
                   'movie',
                   'video movie')),
     filtered_k AS
  (SELECT id
   FROM keyword
   WHERE keyword IN ('based-on-play',
                     'blood',
                     'doctor',
                     'female-frontal-nudity',
                     'female-nudity',
                     'flashback',
                     'friendship',
                     'hardcore',
                     'husband-wife-relationship',
                     'lesbian',
                     'marriage',
                     'murder',
                     'new-york-city',
                     'non-fiction',
                     'oral-sex',
                     'sequel',
                     'singing',
                     'suicide',
                     'surrealism')),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('director',
                   'editor')),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
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
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,000',
                    '$1,500',
                    '$10,000',
                    '$100',
                    '$15,000',
                    '$2,000',
                    '$20,000',
                    '$200',
                    '$25,000',
                    '$3,000',
                    '$5,000')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Drama',
                    'Short');