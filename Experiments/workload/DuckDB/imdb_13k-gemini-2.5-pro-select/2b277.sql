
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'video movie'))
  AND mi1.info_type_id IN ('105')
  AND mi1.info IN ('$1,000',
                    '$1,500',
                    '$200',
                    '$30,000',
                    '$5,000',
                    '$50,000')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Comedy',
                    'Drama',
                    'Short')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('cigarette-smoking',
                     'death',
                     'dog',
                     'family-relationships',
                     'father-son-relationship',
                     'hospital',
                     'husband-wife-relationship',
                     'independent-film',
                     'lesbian',
                     'love',
                     'non-fiction',
                     'party',
                     'sex',
                     'singer',
                     'singing',
                     'tv-mini-series'));