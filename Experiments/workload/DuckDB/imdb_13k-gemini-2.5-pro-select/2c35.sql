WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND title IN ('(#1.13)',
                   '(#1.27)',
                   '(#1.54)',
                   '(#2.1)',
                   '(#2.13)',
                   '(#2.20)',
                   '(#2.33)',
                   '(#3.20)',
                   '(#3.25)',
                   '(#3.27)',
                   '(#3.33)',
                   '(#5.1)',
                   '(#5.20)',
                   '(#5.24)',
                   '(#6.15)',
                   'Babicka',
                   'Boy Meets Girl',
                   'Doctors Wives',
                   'Explosion',
                   'Fantômas',
                   'Giant',
                   'Heritage',
                   'Hurricane',
                   'Letter of the Law',
                   'Miracle on 34th Street',
                   'Miyamoto Musashi',
                   'Monkey Business',
                   'Nob Hill',
                   'Opening Night',
                   'Stranger in Town',
                   'The Counterfeiters',
                   'The Deal',
                   'The Desperado',
                   'The Engagement',
                   'The Foxes of Harrow',
                   'The Genius',
                   'The Hunt',
                   'The Legend',
                   'The Payoff',
                   'The Perils of Pauline',
                   'The Scarlet Letter',
                   'The Snake Pit',
                   'Waterloo')
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
   WHERE gender IN ('f',
                    'm')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('actor',
                   'cinematographer',
                   'editor',
                   'guest',
                   'writer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('4')
  AND mi2.info_type_id IN ('2')
  AND mi1.info IN ('Bulgarian',
                    'Georgian',
                    'German',
                    'Greek',
                    'Japanese',
                    'Mandarin',
                    'Portuguese',
                    'Swedish')
  AND mi2.info IN ('Black and White',
                    'Color');