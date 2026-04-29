
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
  AND mi2.info IN ('103',
                    '68',
                    'Germany:43',
                    'USA:17',
                    'USA:21',
                    'USA:30',
                    'USA:5',
                    'USA:55',
                    'USA:86',
                    'USA:95')
  AND it2.id IN ('1')
  AND t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.5508)',
                   '(#1.6045)',
                   '(#1.708)',
                   '(#3.18)',
                   '(#5.109)',
                   '(#6.67)',
                   '(1997-12-19)',
                   '(1999-02-03)',
                   '(1999-05-17)',
                   '(2004-05-11)',
                   '(2006-05-19)',
                   '(2006-11-25)',
                   '(2007-04-04)',
                   '(2007-11-01)',
                   '(2008-02-05)',
                   '(2011-10-12)',
                   '(2012-05-11)',
                   '(2012-12-19)',
                   'About Cherry',
                   'Blindside',
                   'Breaking Up Is Hard to Do',
                   'Cant Hardly Wait',
                   'D-Day Remembered',
                   'Deliver Us from Eva',
                   'Guys Choice',
                   'Heaven and Earth',
                   'Horns',
                   'Kickboxer',
                   'Lemonade Mouth',
                   'Maid in America',
                   'Mütter und Töchter',
                   'SD Gundam Force',
                   'Seattle',
                   'Showtime',
                   'Stranger in a Strange Land',
                   'Swerve',
                   'Tattoo',
                   'The Collector',
                   'The Dancer',
                   'The Fluffer',
                   'The Graveyard Shift',
                   'Treehouse of Horror V',
                   'Tsunami Aid: A Concert of Hope',
                   'Unaired Pilot')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND n.gender IN ('f',
                    'm')
  AND rt.role IN ('composer');