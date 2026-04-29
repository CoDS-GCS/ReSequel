WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1975 AND 2015
     AND title IN ('(#1.306)',
                   '(#1.5103)',
                   '(#1.5285)',
                   '(#1.6055)',
                   '(#18.38)',
                   '(#3.210)',
                   '(#6.16)',
                   '(2001-03-27)',
                   '(2010-05-07)',
                   '(2012-08-25)',
                   '2000 Blockbuster Entertainment Awards',
                   'BET Awards 2012',
                   'Bedazzled',
                   'Biggel and Pamu Do Their Best to Finish Their Big Challenge',
                   'Brando',
                   'Brothers Little Helper',
                   'Façade',
                   'Four Nerds and a Bird',
                   'Friends Without Benefits',
                   'Goodbye Paradise',
                   'Im Still Here',
                   'Jericho',
                   'Little Things',
                   'Look How Far Weve Come',
                   'Look Whos Stalking',
                   'Love Lies Bleeding',
                   'Pasión',
                   'Picture Bride',
                   'Playhouse',
                   'Primary Colors',
                   'Rubber Room',
                   'SIS',
                   'Señales',
                   'Shock',
                   'Sons of Liberty',
                   'Strip Poker',
                   'Studio',
                   'Taiho shichauzo',
                   'The Journal',
                   'The Libertine',
                   'The Squeeze',
                   'The Taming of the Shrew',
                   'Wall to Wall Fashion',
                   'When the Cats Away')
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'composer',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('7')
  AND mi1.info IN ('Belgium',
                    'Colombia',
                    'Germany',
                    'Indonesia',
                    'Malaysia',
                    'Mexico',
                    'Serbia',
                    'South Korea')
  AND mi2.info IN ('CAM:Arri Alexa',
                    'CAM:Arriflex Cameras and Lenses',
                    'CAM:Canon XL-1',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:DeLuxe, USA',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'LAB:Synchro Film, Austria',
                    'LAB:Technicolor',
                    'PCS:(anamorphic)',
                    'PCS:Super 35',
                    'RAT:1.37 : 1',
                    'RAT:1.78 : 1 / (anamorphic)',
                    'RAT:1.85 : 1');