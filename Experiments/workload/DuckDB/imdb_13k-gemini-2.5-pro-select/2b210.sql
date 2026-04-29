
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Drama',
                    'Horror',
                    'Short')
  AND mi2.info_type_id IN ('105')
  AND mi2.info IN ('$10,000',
                    '$15,000',
                    '$2,000',
                    '$20,000',
                    '$4,000',
                    '$50,000',
                    '£1,000',
                    '€ 1,000')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'costume designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('blood',
                     'father-daughter-relationship',
                     'female-nudity',
                     'jealousy',
                     'sequel',
                     'song'));