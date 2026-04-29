
SELECT COUNT(*)
FROM title AS t,
     cast_info AS ci,
     movie_info AS mi1,
     movie_info AS mi2
WHERE t.id = ci.movie_id
  AND t.id = mi1.movie_id
  AND t.id = mi2.movie_id
  AND t.production_year <= 2015
  AND t.production_year >= 1990
  AND t.title IN ('(#1.207)',
                   '(#1.3486)',
                   '(#1.4273)',
                   '(#1.5286)',
                   '(#1.6067)',
                   '(#1.670)',
                   '(#2.53)',
                   '(#5.58)',
                   '(#8.45)',
                   '(2006-11-04)',
                   '(2007-06-24)',
                   '(2008-10-31)',
                   '(2009-01-01)',
                   '(2010-12-28)',
                   '(2011-12-01)',
                   '(2012-10-30)',
                   'Benjamin',
                   'Blowback',
                   'Burlesque',
                   'Capitulo 72',
                   'Country Boys',
                   'Do Over',
                   'Escape from L.A.',
                   'Excellent Cadavers',
                   'Faith',
                   'Future Perfect',
                   'Gala RTP 50 Anos',
                   'Heartless',
                   'Hidden Secrets',
                   'Honesty',
                   'Jurassic Bark',
                   'Lazos de sangre',
                   'Libera me',
                   'Me encanta que los planes salgan bien',
                   'Nit vint-i-cinc',
                   'One Weak Link',
                   'Phil Is a Choo-Choo Charlie',
                   'Powder Blue',
                   'Shes All That',
                   'Sinners',
                   'Soccer',
                   'Suddenly Single',
                   'Taking Control',
                   'The Garage',
                   'The Human Shield')
  AND mi1.info_type_id IN ('1')
  AND mi1.info IN ('104',
                    '105',
                    '107',
                    '30',
                    '32',
                    '61',
                    '91',
                    'Germany:45',
                    'USA:14',
                    'USA:48',
                    'USA:82',
                    'USA:85',
                    'USA:90')
  AND mi2.info_type_id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('editor',
                   'miscellaneous crew',
                   'writer'));