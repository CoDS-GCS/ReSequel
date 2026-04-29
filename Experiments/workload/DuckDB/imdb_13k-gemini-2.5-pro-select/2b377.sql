
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
                   'movie'))
  AND mi1.info_type_id IN ('4')
  AND mi1.info IN ('English',
                    'German',
                    'Spanish')
  AND mi2.info_type_id IN ('1')
  AND mi2.info IN ('25',
                    '27',
                    '5',
                    '50',
                    '90',
                    'Germany:24',
                    'USA:14')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('production designer',
                   'writer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('dancing',
                     'husband-wife-relationship',
                     'jealousy',
                     'police',
                     'singer'));