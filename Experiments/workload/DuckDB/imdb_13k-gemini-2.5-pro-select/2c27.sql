
SELECT COUNT(*)
FROM movie_info AS mi1
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON mi1.movie_id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN title AS t ON mi1.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE mi1.info IN ('Argentina:13',
                    'Australia:M',
                    'Canada:18+',
                    'Chile:18',
                    'Netherlands:12',
                    'Netherlands:6',
                    'Norway:15',
                    'Philippines:R-18',
                    'Portugal:M/12',
                    'UK:PG',
                    'USA:G')
  AND it1.id IN ('5')
  AND mi2.info IN ('Almería, Andalucía, Spain',
                    'Chicago, Illinois, USA',
                    'Hamburg, Germany',
                    'Iverson Ranch - 1 Iverson Lane, Chatsworth, Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Metro-Goldwyn-Mayer Studios - 10202 W. Washington Blvd., Culver City, California, USA',
                    'Munich, Bavaria, Germany',
                    'Paris, France',
                    'Sydney, New South Wales, Australia',
                    'Twickenham Film Studios, St Margarets, Twickenham, Middlesex, England, UK',
                    'UK')
  AND it2.id IN ('18')
  AND t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.140)',
                   '(#1.2)',
                   '(#1.227)',
                   '(#1.546)',
                   '(#1.661)',
                   '(#1.968)',
                   '(#3.2)',
                   '(#5.10)',
                   '(#7.8)',
                   'A Day in the Life',
                   'A Night of Comic Relief 2',
                   'Baby Love',
                   'Bakafácán',
                   'Bedtime Story',
                   'Bokser',
                   'Collision Course',
                   'David Copperfield',
                   'Iceman',
                   'La Gioconda',
                   'Lola',
                   'On the Road',
                   'Pelle erobreren',
                   'Picking Up the Pieces',
                   'Schönes Wochenende',
                   'Shag',
                   'Sniper',
                   'Squeeze Play',
                   'Stand Up and Be Counted',
                   'Surprise Party',
                   'That Old Gang of Mine',
                   'The Choice',
                   'The Equalizer',
                   'The Experts',
                   'The Loser',
                   'The Prisoner of Zenda',
                   'The Promotion',
                   'The Soldier',
                   'The Tycoon',
                   'Treasure',
                   'Voyna i mir',
                   'WWF Superstars of Wrestling')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('director',
                   'miscellaneous crew',
                   'production designer');