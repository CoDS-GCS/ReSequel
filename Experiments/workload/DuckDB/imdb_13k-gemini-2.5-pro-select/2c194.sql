WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 2015
     AND title IN ('(#1.5059)',
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
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('m')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actress',
                   'editor',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('5')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Finland:S',
                    'Hong Kong:IIB',
                    'Norway:7',
                    'Sweden:15',
                    'USA:X')
  AND mi2.info IN ('Black and White',
                    'Color');