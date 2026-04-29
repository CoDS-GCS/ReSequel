
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
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Netherlands:AL',
                    'UK:R18')
  AND mi2.info_type_id IN ('4')
  AND mi2.info IN ('English')
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'director'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND mk.keyword_id IN
    (SELECT id
     FROM keyword
     WHERE keyword IN ('barbes-market-paris',
                     'bullock',
                     'copycat-murder',
                     'french-fleet',
                     'garage-beatdown',
                     'gharial',
                     'hanuman',
                     'homosexual-love',
                     'idleness',
                     'office-manager',
                     'paiwan',
                     'photocell',
                     'racing-blood',
                     'ring-of-stones',
                     'sebaceous-cyst',
                     'snob',
                     'societal-dysfunction',
                     'staircase-waterfall',
                     'win',
                     'writing-a-letter-home'));