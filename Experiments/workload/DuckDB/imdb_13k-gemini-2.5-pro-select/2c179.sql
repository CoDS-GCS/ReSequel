WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#1.104)',
                   '(#1.99)',
                   '(#4.10)',
                   '(#5.20)',
                   'Anna',
                   'Artists and Models Abroad',
                   'Bedtime Story',
                   'Boy Meets Girl',
                   'Casablanca',
                   'Court Martial',
                   'Crack-Up',
                   'Heung gong chat sup sam',
                   'Kabale und Liebe',
                   'Let em Have It',
                   'Los miserables',
                   'Nana',
                   'Pursued',
                   'Ramona',
                   'Richard III',
                   'Samurai',
                   'Snow Job',
                   'Tango',
                   'The Arrangement',
                   'The Cat and the Fiddle',
                   'The Dark Angel',
                   'The Killers',
                   'The Losers',
                   'The Patsy',
                   'The Road Back',
                   'The Shepherd of the Hills',
                   'The Swordsman',
                   'The Well',
                   'Till the Clouds Roll By',
                   'Unser Sandmännchen',
                   'Whirlpool',
                   'Wyoming',
                   'You Cant Cheat an Honest Man')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
SELECT COUNT(*)
FROM t_filtered
JOIN cast_info AS ci ON t_filtered.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t_filtered.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t_filtered.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IS NULL
  AND rt.role IN ('producer',
                   'production designer')
  AND it1.id IN ('5')
  AND mi1.info IN ('Australia:PG',
                    'Finland:K-16',
                    'Finland:K-18',
                    'Italy:VM18',
                    'Norway:15',
                    'Sweden:15',
                    'UK:15',
                    'UK:PG')
  AND it2.id IN ('8')
  AND mi2.info IN ('Canada',
                    'France',
                    'Hong Kong',
                    'Italy',
                    'Spain',
                    'West Germany');