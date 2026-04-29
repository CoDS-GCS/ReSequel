
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN info_type AS it2 ON mi2.info_type_id = it2.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
WHERE t.production_year BETWEEN 1925 AND 2015
  AND t.title IN ('(#1.5059)',
                   '(#5.52)',
                   '(#8.42)',
                   '(1995-12-21)',
                   '(1998-08-18)',
                   '(2003-02-24)',
                   '(2005-06-19)',
                   '(2009-01-23)',
                   '(2010-03-28)',
                   '(2010-05-30)',
                   '(2010-06-29)',
                   '(2010-11-23)',
                   'Common',
                   'Culture',
                   'Death of a Dynasty',
                   'Der Geburtstag',
                   'Equal Justice',
                   'Eurovisión',
                   'Grief',
                   'Guinea Pigs',
                   'Live 8',
                   'Loggerheads',
                   'Lose Yourself',
                   'MacGruber',
                   'Milfay',
                   'No Way to Treat a Lady',
                   'One More Kiss',
                   'Opposite Day',
                   'Paradise Alley',
                   'Shark Week',
                   'Spirit Warriors',
                   'The Expert',
                   'The Look of Love',
                   'The Tipping Point',
                   'Were Not at Charm School Learning How to Be a Gentleman, Were Racing')
  AND kt.kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')
  AND rt.role IN ('actress',
                   'editor',
                   'writer')
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND it1.id IN ('5')
  AND it2.id IN ('2')
  AND mi1.info IN ('Finland:S',
                    'Hong Kong:IIB',
                    'Norway:7',
                    'Sweden:15',
                    'USA:X')
  AND mi2.info IN ('Black and White',
                    'Color');