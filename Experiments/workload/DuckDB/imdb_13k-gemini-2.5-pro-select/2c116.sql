
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1990 AND 2015
  AND t.title IN ('(#1.32)',
                   '(#1.3445)',
                   '(#1.4901)',
                   '(#1.4937)',
                   '(#1.5409)',
                   '(#29.2)',
                   '(#3.221)',
                   '(#8.42)',
                   '(1997-02-07)',
                   '(2002-03-14)',
                   '(2003-04-30)',
                   '(2004-07-10)',
                   '(2005-03-20)',
                   '(2009-06-03)',
                   '(2011-02-23)',
                   '(2011-09-29)',
                   '(2011-10-16)',
                   '(2012-09-03)',
                   'Bigger Stronger Faster*',
                   'Driving Lessons',
                   'Factotum',
                   'Found Money',
                   'Gloria',
                   'Its Kind of a Funny Story',
                   'Love and Other Disasters',
                   'Ned Kelly',
                   'Patriot Games',
                   'Push Comes to Shove',
                   'Stateside',
                   'Sunshine Cleaning',
                   'The Bracelet of Bordeaux',
                   'The Darkness',
                   'The Frontier Boys',
                   'The Killing of a Japanese Bookie',
                   'The Need for Speed',
                   'The Rehearsal',
                   'Time Out of Mind',
                   'Toda la verdad',
                   'Verdad al descubierto',
                   'Whos the Daddy?')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('3')
       AND mi1.info IN ('Comedy',
                    'Documentary',
                    'Mystery',
                    'Romance',
                    'Short'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('7')
       AND mi2.info IN ('CAM:Arri Alexa',
                    'CAM:Canon XL-2',
                    'CAM:Moviecam Cameras',
                    'CAM:Red Epic',
                    'CAM:Red One Camera',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'LAB:Laboratoires Éclair, Paris, France',
                    'PCS:Digital',
                    'RAT:1.78 : 1',
                    'RAT:2.20 : 1'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('costume designer')
       AND (n.gender IN ('f')
            OR n.gender IS NULL));