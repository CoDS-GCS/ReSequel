
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('11',
                    '15',
                    '17',
                    '51',
                    '58',
                    '65',
                    '73',
                    '8',
                    '90',
                    'USA:50')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('English',
                    'Spanish')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('death',
                     'gay',
                     'gun',
                     'homosexual',
                     'kidnapping',
                     'mother-daughter-relationship',
                     'number-in-title',
                     'one-word-title',
                     'revenge',
                     'sex',
                     'singer'));