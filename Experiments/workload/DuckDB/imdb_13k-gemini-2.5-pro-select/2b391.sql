WITH t_filtered AS
  (SELECT t.id
   FROM title t
   JOIN kind_type kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1950 AND 2010
     AND kt.kind IN ('episode',
                   'movie',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN keyword AS k ON mk.keyword_id = k.id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info_type_id IN ('6')
  AND mi1.info IN ('Mono',
                    'Stereo')
  AND mi2.info_type_id IN ('5')
  AND mi2.info IN ('Australia:M',
                    'Iceland:12',
                    'UK:15',
                    'UK:X')
  AND n.gender IN ('m')
  AND rt.role IN ('editor')
  AND k.keyword IN ('assassination-of-robert-f.-kennedy',
                     'book-binding',
                     'crushed-foot',
                     'czar-ivan-iv-of-russia',
                     'doctor-faustef',
                     'dog-on-motorcycle',
                     'driver-falling-asleep',
                     'english-restoration',
                     'herb-shop',
                     'iron-ore',
                     'jinniku',
                     'mother-drowning-her-children',
                     'pet-deer',
                     'pioneer-camp',
                     'pro-wrestling',
                     'reference-to-irene-castle',
                     'shao-fang-house',
                     'sickle-cell-anemia',
                     'throwing-water-onto-ones-face',
                     'unknown-creature',
                     'wetsuit',
                     'white-sand-beach',
                     'wrestling-team');