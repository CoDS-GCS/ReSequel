
SELECT COUNT(*)
FROM name AS n
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
WHERE n.gender IN ('m')
  AND rt.role IN ('director')
  AND t.production_year BETWEEN 1975 AND 2015
  AND t.title IN ('(#1.27)',
                   '(#1.6308)',
                   '(#16.15)',
                   '(#3.0)',
                   '(#5.175)',
                   '(#5.74)',
                   '(#8.56)',
                   '(2000-04-24)',
                   '(2004-11-02)',
                   '(2008-04-03)',
                   '(2009-11-16)',
                   '(2011-07-12)',
                   '(2011-12-03)',
                   '(2012-01-24)',
                   '...And a Yacht',
                   'A Line in the Sand',
                   'Abomination',
                   'Automatic for the People',
                   'Before the Rain',
                   'Critical Mass',
                   'Dead Wood',
                   'House of D',
                   'In Good Company',
                   'Jekyll & Hyde: The Musical',
                   'Lamour fou',
                   'Mortal Kombat',
                   'Rain Man',
                   'Running the Show',
                   'Skin',
                   'The End of the Innocence',
                   'The Peacemaker',
                   'The Sentinel',
                   'To Grandmothers House We Go',
                   'Todesengel',
                   'Xica da Silva',
                   'Zombie Brigade')
  AND kt.kind IN ('episode',
                   'movie',
                   'video movie')
  AND it1.id IN ('4')
  AND mi1.info IN ('Arabic',
                    'Croatian',
                    'Georgian',
                    'German',
                    'Hebrew',
                    'Italian',
                    'Mandarin',
                    'Oriya',
                    'Swiss German',
                    'Tamil',
                    'Thai')
  AND it2.id IN ('2')
  AND mi2.info IN ('Black and White',
                    'Color');