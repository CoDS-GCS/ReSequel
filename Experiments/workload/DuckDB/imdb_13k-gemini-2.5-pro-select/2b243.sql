WITH mi1_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('1')
     AND mi.info IN ('10',
                    '105',
                    '25',
                    '95',
                    'USA:60')),
     mi2_filtered AS
  (SELECT mi.movie_id
   FROM movie_info mi
   WHERE mi.info_type_id IN ('6')
     AND mi.info IN ('Mono'))
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
WHERE t.production_year BETWEEN 1875 AND 1975
  AND kt.kind IN ('movie',
                   'tv movie')
  AND rt.role IN ('actress',
                   'director')
  AND n.gender IN ('f',
                    'm')
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