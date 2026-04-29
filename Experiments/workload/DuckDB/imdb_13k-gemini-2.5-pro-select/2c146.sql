
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
  AND t.title IN ('(#5.15)',
                   '(#6.24)',
                   'Ah, Wilderness!',
                   'Caesars Wife',
                   'Custers Last Stand',
                   'Death Sentence',
                   'Delayed Action',
                   'Der Vogelhändler',
                   'Föltámadott a tenger',
                   'Gaslight',
                   'Jet Pilot',
                   'La chica del gato',
                   'Mistaken Identity',
                   'Mrs. Parkington',
                   'Music Hath Charms',
                   'One Life to Live',
                   'Pack Up Your Troubles',
                   'Ramona',
                   'Something for the Birds',
                   'Son of Sinbad',
                   'The Awful Truth',
                   'The Doctor',
                   'The Girl of the Golden West',
                   'The Inside Man',
                   'The Payoff',
                   'The Story of Will Rogers',
                   'Troubled Waters',
                   'Wing and a Prayer',
                   'Winged Victory')
  AND mi1.info_type_id IN ('2')
  AND mi1.info IN ('Black and White',
                    'Color')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Animation',
                    'Game-Show',
                    'Mystery',
                    'Romance',
                    'Thriller',
                    'War',
                    'Western')
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
     WHERE gender IN ('f'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'editor',
                   'production designer',
                   'writer'));