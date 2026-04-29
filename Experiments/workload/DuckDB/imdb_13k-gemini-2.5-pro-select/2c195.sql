
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
WHERE mi1.info IN ('Black and White',
                    'Color')
  AND it1.id IN ('2')
  AND mi2.info IN ('Berlin, Germany',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'London, England, UK',
                    'Los Angeles, California, USA',
                    'Madrid, Spain',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA',
                    'Republic Studios - 4024 Radford Avenue, North Hollywood, Los Angeles, California, USA',
                    'Samuel Goldwyn Studios - 7200 Santa Monica Boulevard, West Hollywood, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND it2.id IN ('18')
  AND t.production_year BETWEEN 1875 AND 1975
  AND t.title IN ('(#1.64)',
                   '(#1.86)',
                   '(#1.97)',
                   '(#3.12)',
                   '(#3.52)',
                   '(#6.11)',
                   '2001: A Space Odyssey',
                   'April Fool',
                   'Border Incident',
                   'California',
                   'Captain Blood',
                   'Cinderella Jones',
                   'Destry Rides Again',
                   'Dick Tracy Returns',
                   'Ein idealer Gatte',
                   'Gabriela',
                   'Gunfight at the O.K. Corral',
                   'I promessi sposi',
                   'It Happened One Night',
                   'Key Witness',
                   'Linda',
                   'Madeleine',
                   'Miracle on 34th Street',
                   'Mutiny on the Bounty',
                   'Nob Hill',
                   'Nocturne',
                   'Quarta puntata',
                   'Singin in the Rain',
                   'Stagecoach',
                   'Step Lively',
                   'The Accident',
                   'The Bargain',
                   'The Contest',
                   'The Crucible',
                   'The Deserter',
                   'The First Day',
                   'The Game',
                   'The Great Train Robbery',
                   'The Hostage',
                   'The Lost City',
                   'The Milkman',
                   'The Picture of Dorian Gray',
                   'The Terror',
                   'The Whole Towns Talking',
                   'Triple Cross',
                   'Up Front')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('cinematographer');