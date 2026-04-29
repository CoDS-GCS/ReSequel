WITH filtered_movies AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1925 AND 1975
     AND t.title IN ('(#2.3)',
                   '(#5.16)',
                   'Arabian Nights',
                   'Arena',
                   'Bad Company',
                   'Blazing Saddles',
                   'Collision Course',
                   'Cry Wolf',
                   'Dead or Alive',
                   'Diane',
                   'Die Brücke',
                   'Dillinger',
                   'Double Trouble',
                   'Drums of Fu Manchu',
                   'Giuseppe Verdi',
                   'Gone with the Wind',
                   'Government Girl',
                   'Its a Small World',
                   'Jack the Ripper',
                   'Lilith',
                   'Oceans Eleven',
                   'Part 3',
                   'Rescue',
                   'Riffraff',
                   'Rio Rita',
                   'Runaway',
                   'Shichinin no samurai',
                   'Sister Kenny',
                   'The Enchanted',
                   'The Experiment',
                   'The Gunman',
                   'The Inheritance',
                   'The Lottery Lover',
                   'The Reluctant Dragon',
                   'The Scavengers',
                   'The Tiger Woman',
                   'Universal Newsreel',
                   'Victory',
                   'World of Sport',
                   'You Cant Take It with You')
     AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game'))
SELECT COUNT(*)
FROM filtered_movies AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('m')
  AND rt.role IN ('editor',
                   'writer')
  AND it1.id IN ('4')
  AND mi1.info IN ('Danish',
                    'Hebrew',
                    'Hindi',
                    'Italian',
                    'Korean',
                    'Mandarin')
  AND it2.id IN ('7')
  AND mi2.info IN ('LAB:Technicolor, USA',
                    'MET:600 m',
                    'OFM:35 mm',
                    'PCS:Kinescope',
                    'PCS:Techniscope',
                    'PFM:Video',
                    'RAT:1.20 : 1',
                    'RAT:2.35 : 1');