WITH mk_filtered AS
  (SELECT mk.movie_id
   FROM movie_keyword mk
   JOIN keyword k ON mk.keyword_id = k.id
   WHERE k.keyword IN ('art-publisher',
                     'body-in-dumpster',
                     'cell-transfer',
                     'dead-body-fed-to-pigs',
                     'dodging-bullets',
                     'finger-of-death',
                     'flying-bird',
                     'intro-sung-by-cast-member',
                     'kinetoscope',
                     'prison-fight',
                     'reference-to-flanneryoconnor',
                     'reference-to-reginald-rose',
                     'reference-to-ulysses',
                     'spanish-wine',
                     'starting-smoking',
                     'super-8',
                     'television-critic',
                     'unaired-episode',
                     'undead-priest',
                     'vibrating-bed',
                     'w.i.p',
                     'woman-pretending-to-be-a-man'))
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
  AND it1.id IN ('1')
  AND mi1.info IN ('100',
                    '22',
                    '25',
                    '30',
                    '7',
                    '70',
                    '82',
                    '85',
                    '9',
                    '91',
                    '93',
                    '95',
                    'USA:30',
                    'USA:60')
  AND it2.id IN ('6')
  AND mi2.info IN ('Mono',
                    'Stereo')
  AND rt.role IN ('actress',
                   'composer')
  AND n.gender IN ('m');