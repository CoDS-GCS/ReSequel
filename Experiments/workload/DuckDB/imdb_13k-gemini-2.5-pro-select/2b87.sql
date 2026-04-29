
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Austria',
                    'Belgium',
                    'Brazil',
                    'Hungary',
                    'India',
                    'Mexico',
                    'Poland',
                    'Spain')
  AND mi2.info IN ('Mono',
                    'Silent')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie'))
  AND mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('6')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('costume designer',
                   'production designer'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IS NULL)
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('based-on-play',
                     'cigarette-smoking',
                     'friendship',
                     'independent-film',
                     'jealousy',
                     'lesbian-sex',
                     'male-nudity',
                     'marriage',
                     'mother-daughter-relationship',
                     'one-word-title',
                     'oral-sex',
                     'police',
                     'singing',
                     'song'));