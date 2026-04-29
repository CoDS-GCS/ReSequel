
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 1975
  AND t.production_year >= 1925
  AND t.title IN ('(#1.110)',
                   '(#4.22)',
                   'Airport',
                   'Backlash',
                   'Custers Last Stand',
                   'Die Falle',
                   'Die Fledermaus',
                   'Double Cross',
                   'Follow the Leader',
                   'Gone to Earth',
                   'Great Expectations',
                   'Honky Tonk',
                   'Noblesse Oblige',
                   'Otello',
                   'Paula',
                   'Please Believe Me',
                   'Revolucni rok 1848',
                   'Runaway',
                   'The Black Widow',
                   'The Contract',
                   'The Execution',
                   'The Front Page',
                   'The Fugitive',
                   'The Imposter',
                   'The Impostor',
                   'The Intruder',
                   'The Sea of Grass',
                   'The Secret Life of Walter Mitty',
                   'The Silver Chalice',
                   'The Snows of Kilimanjaro',
                   'The Trouble with Women',
                   'Treasure Island',
                   'Your Witness')
  AND mi1.info_type_id IN ('7')
  AND mi1.info IN ('CAM:Panavision Lenses',
                    'LAB:DeLuxe',
                    'LAB:Movielab, USA',
                    'LAB:Technicolor, UK',
                    'OFM:35 mm',
                    'OFM:65 mm',
                    'OFM:Video',
                    'PCS:CinemaScope',
                    'PCS:Kinescope',
                    'PCS:Techniscope',
                    'RAT:1.33 : 1',
                    'RAT:2.20 : 1',
                    'RAT:2.35 : 1',
                    'RAT:4:3')
  AND mi2.info_type_id IN ('18')
  AND mi2.info IN ('Corriganville, Ray Corrigan Ranch, Simi Valley, California, USA',
                    'Filmways Studios - 246 East 127th Street, East Harlem, Manhattan, New York City, New York, USA',
                    'Los Angeles, California, USA',
                    'Rome, Lazio, Italy',
                    'Stage 28A, Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA',
                    'Stage 36, Universal Studios - 100 Universal City Plaza, Universal City, California, USA',
                    'Universal Studios - 100 Universal City Plaza, Universal City, California, USA')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('f',
                    'm'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('composer',
                   'costume designer',
                   'producer',
                   'production designer',
                   'writer'));