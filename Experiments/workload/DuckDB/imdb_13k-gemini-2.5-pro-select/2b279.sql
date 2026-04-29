
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
     WHERE kind IN ('tv movie',
                   'tv series',
                   'video game'))
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Australia:MA',
                    'France:U',
                    'Germany:18',
                    'Netherlands:AL',
                    'Norway:18',
                    'Portugal:M/12',
                    'Spain:T',
                    'West Germany:16',
                    'West Germany:18')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('English',
                    'French')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'editor'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('cigarette-smoking',
                     'friendship',
                     'police',
                     'surrealism',
                     'violence'));