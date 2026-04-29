WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('apple-picker',
                     'balloonist',
                     'clothes-cut-off',
                     'contempt-of-congress',
                     'country-doctor',
                     'early-christian',
                     'high-altitude',
                     'horading-money',
                     'lion-fight',
                     'mugged',
                     'nod',
                     'playing-solitaire',
                     'pretending-to-be-statue',
                     'receptor',
                     'reference-to-joe-namath',
                     'sandwich-seat',
                     'star-wars-documentary',
                     'trucking',
                     'year-1866'))
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN mk_filtered AS mk ON t.id = mk.movie_id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND kt.kind IN ('tv movie',
                   'tv series',
                   'video game')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:G',
                    'Canada:PG',
                    'Canada:R',
                    'Iceland:16',
                    'South Korea:12',
                    'South Korea:15',
                    'Spain:T',
                    'UK:15',
                    'USA:PG')
  AND it2.id IN ('6')
  AND mi2.info IN ('DTS',
                    'Dolby',
                    'Mono',
                    'SDDS',
                    'Stereo')
  AND rt.role IN ('producer')
  AND n.gender IN ('m');