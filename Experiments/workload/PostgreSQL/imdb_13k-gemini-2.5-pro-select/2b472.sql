WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('5')
     AND mi.info IN ('Netherlands:AL',
                    'UK:R18')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('4')
     AND mi.info IN ('English'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN mi1_filtered mi1 ON t.id = mi1.movie_id
JOIN mi2_filtered mi2 ON t.id = mi2.movie_id
WHERE t.production_year BETWEEN 1950 AND 2010
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND rt.role IN ('actor',
                   'director')
  AND n.gender IN ('m')
  AND k.keyword IN ('barbes-market-paris',
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
                     'writing-a-letter-home');