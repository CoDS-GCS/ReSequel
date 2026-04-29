
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('2')
AND mi1.info IN ('Color')
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
AND mi2.info_type_id IN ('7')
AND mi2.info IN ('LAB:Technicolor',
                    'LAB:Technicolor, USA',
                    'MET:1800 m',
                    'MET:900 m',
                    'OFM:35 mm',
                    'OFM:Live',
                    'PCS:Panavision',
                    'PFM:35 mm',
                    'RAT:1.66 : 1')
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('cinematographer',
                   'director',
                   'guest',
                   'miscellaneous crew',
                   'producer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f',
                    'm')
     OR n.gender IS NULL)
WHERE t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.93)',
                   '(#2.36)',
                   'A Star Is Born',
                   'Accidents Will Happen',
                   'After the Ball',
                   'All at Sea',
                   'Career',
                   'Cinderella',
                   'Collectors Item',
                   'Double Cross',
                   'Executive Action',
                   'Jeanne Eagels',
                   'Les deux orphelines',
                   'Mistaken Identity',
                   'Mr. Skeffington',
                   'New Musical Express Poll Winners Concert',
                   'O.S.S.',
                   'Outrage',
                   'Rebecca',
                   'Reno',
                   'Saturdays Hero',
                   'Smoke Screen',
                   'Stand Up and Be Counted',
                   'Success Story',
                   'Sweethearts',
                   'The Clown',
                   'The Condemned',
                   'The Dinner Party',
                   'The Game',
                   'The Guest',
                   'The Gun Runners',
                   'The Journey',
                   'The Outcasts of Poker Flat',
                   'The Payoff',
                   'The Prophet',
                   'The Secret Life of Walter Mitty',
                   'The Silver Chalice',
                   'The Storm',
                   'The Stowaway',
                   'Vodkaa, komisario Palmu');