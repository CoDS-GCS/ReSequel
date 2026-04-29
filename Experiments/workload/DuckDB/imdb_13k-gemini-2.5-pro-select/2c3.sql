WITH t_filtered AS
  (SELECT t.id
   FROM title AS t
   JOIN kind_type AS kt ON t.kind_id = kt.id
   WHERE t.production_year BETWEEN 1875 AND 1975
     AND t.title IN ('(#1.19)',
                   '(#1.33)',
                   '(#1.83)',
                   '(#2.10)',
                   '(#3.3)',
                   '(#6.17)',
                   'After the Thin Man',
                   'Around the World in Eighty Days',
                   'Borderline',
                   'Bottoms Up',
                   'College Holiday',
                   'Der müde Theodor',
                   'Die Ratten',
                   'Double Date',
                   'Dream Girl',
                   'Fedora',
                   'Funny Girl',
                   'Fünfter Teil',
                   'Gang War',
                   'Going Home',
                   'Her Highness and the Bellboy',
                   'Justice',
                   'Lady Luck',
                   'Let em Have It',
                   'Lili',
                   'Love and Marriage',
                   'Navy Blues',
                   'Now You See Him, Now You Dont',
                   'Parnell',
                   'Part 3',
                   'Partners',
                   'Shine on Harvest Moon',
                   'Stakeout',
                   'Target',
                   'The Accident',
                   'The Buccaneer',
                   'The Charge of the Light Brigade',
                   'The Edge of Night',
                   'The Fanatics',
                   'The Haunted House',
                   'The Inside Man',
                   'The Love God?',
                   'The Mission',
                   'The Petty Girl',
                   'The Storm',
                   'Up the Junction')
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
  AND rt.role IN ('costume designer',
                   'guest',
                   'production designer')
  AND it1.id IN ('3')
  AND mi1.info IN ('Adult',
                    'Adventure',
                    'Game-Show',
                    'History',
                    'Western')
  AND it2.id IN ('6')
  AND mi2.info IN ('70 mm 6-Track',
                    'Mono',
                    'Silent',
                    'Stereo');