WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND kt.kind IN ('movie',
                   'tv movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('1')
  AND mi1.info IN ('10',
                    '105',
                    '25',
                    '95',
                    'USA:60')
  AND mi2.info_type_id IN ('6')
  AND mi2.info IN ('Mono')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('actress',
                   'director')
  AND k.keyword IN ('accomplice-turned-victim',
                     'character-appears-on-a-tv-talk-show',
                     'committee-of-national-liberation',
                     'congo-dealer',
                     'cutting-letters-into-ones-arm',
                     'drowned-boy',
                     'evian-bottled-water',
                     'faked-car-crash',
                     'fashion-designer',
                     'illegal-newspaper',
                     'marrakesh',
                     'new-orleans-louisiana',
                     'pulled-underwater',
                     'roman-porno',
                     'teaching-someone-how-to-cook',
                     'telephone-psychic');