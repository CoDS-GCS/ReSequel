
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
  AND t.title IN ('(#1.106)',
                   '(#1.71)',
                   '(#3.39)',
                   '(#4.20)',
                   '(#4.31)',
                   '(#4.34)',
                   'A Family Affair',
                   'Anthony Adverse',
                   'Antony and Cleopatra',
                   'Calamity Jane',
                   'Confession',
                   'Dobrý voják Svejk',
                   'Don Juan',
                   'Double Date',
                   'Fanny',
                   'Fünfter Teil',
                   'Gunfire',
                   'King of Burlesque',
                   'Labyrinth',
                   'Little Boy Lost',
                   'Love Letters',
                   'Macbeth',
                   'Maya Bazaar',
                   'Mind Your Own Business',
                   'Montserrat',
                   'Peer Gynt',
                   'Reap the Wild Wind',
                   'Renegades',
                   'Rio Grande',
                   'Strange Cargo',
                   'Svadba',
                   'Tartuffe',
                   'Terror',
                   'The Accused',
                   'The Golden Fleece',
                   'The Greatest Story Ever Told',
                   'The Ladies Man',
                   'The Return')
  AND mi1.info_type_id IN ('17')
  AND mi1.info IN ('One of over 700 Paramount Productions, filmed between 1929 and 1949, which were sold to MCA/Universal in 1958 for television distribution, and have been owned and controlled by Universal ever since.')
  AND mi2.info_type_id IN ('8')
  AND mi2.info IN ('Australia',
                    'France',
                    'Germany',
                    'Italy',
                    'Japan',
                    'UK',
                    'USA',
                    'West Germany')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video movie'))
  AND ci.person_id IN
    (SELECT id
     FROM name
     WHERE gender IN ('m'))
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'director',
                   'editor'));