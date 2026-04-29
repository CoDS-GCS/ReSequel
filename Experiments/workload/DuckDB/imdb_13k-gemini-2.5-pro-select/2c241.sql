
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.1671)',
                   '(#1.3711)',
                   '(#1.5630)',
                   '(#1.6267)',
                   '(#10.55)',
                   '(#2.225)',
                   '(#2.50)',
                   '(#4.3)',
                   '(#5.195)',
                   '(#9.75)',
                   '(2003-10-10)',
                   '(2006-03-04)',
                   '(2006-11-20)',
                   '(2007-05-03)',
                   '(2007-10-04)',
                   '(2009-03-19)',
                   '(2009-09-02)',
                   '(2011-01-22)',
                   '11th Annual Screen Actors Guild Awards',
                   'Altlasten',
                   'An Owl in a Thornbush',
                   'Austin Powers in Goldmember',
                   'Conspiracy',
                   'Detox',
                   'Disco Fever',
                   'Fata Morgana',
                   'Freunde',
                   'Happy End',
                   'Homeward Bound II: Lost in San Francisco',
                   'Inkasso',
                   'Jailed in Katrina, Bhutan Motorcycle Crash, Kings Canyon Rescue',
                   'Just for the Record',
                   'Mauvaise fille',
                   'Nothing Lasts Forever',
                   'Portraits',
                   'Ray',
                   'Secrets in the Snow',
                   'Slash Fiction',
                   'Switch',
                   'Sûpâ no onna',
                   'The American Way',
                   'The Storm',
                   'Till My Heartaches End',
                   'Time Out of Mind',
                   'Turbulence')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('6')
       AND mi1.info IN ('4-Track Stereo',
                    '6-Track Stereo',
                    '70 mm 6-Track',
                    'DTS-ES',
                    'DTS-Stereo',
                    'Datasat',
                    'Dolby Stereo',
                    'Dolby',
                    'SDDS',
                    'Silent',
                    'Stereo',
                    'Ultra Stereo'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('7')
       AND mi2.info IN ('CAM:Arriflex Cameras and Lenses',
                    'CAM:Panavision Panaflex Platinum, Panavision Primo Lenses',
                    'LAB:DeLuxe',
                    'LAB:DeLuxe, Hollywood (CA), USA',
                    'LAB:DeLuxe, USA',
                    'LAB:FotoKem Laboratory, Burbank (CA), USA',
                    'OFM:16 mm',
                    'PCS:Digital',
                    'PCS:Panavision',
                    'PCS:Super 16',
                    'PFM:16 mm',
                    'PFM:DVD-ROM',
                    'PFM:Digital',
                    'RAT:1.37 : 1',
                    'RAT:1.85 : 1'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('cinematographer')
       AND (n.gender IN ('f')
            OR n.gender IS NULL));