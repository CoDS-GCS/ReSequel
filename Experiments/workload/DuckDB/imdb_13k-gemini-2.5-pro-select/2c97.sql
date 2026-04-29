WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.6)',
                   '(#3.39)',
                   '(#6.19)',
                   '12',
                   'Ada',
                   'Altri tempi',
                   'Austerlitz',
                   'Call Me Mister',
                   'Charleys Tante',
                   'Chûshingura',
                   'Deadlock',
                   'Dick Tracys G-Men',
                   'Jailhouse Rock',
                   'Marooned',
                   'Miracle on 34th Street',
                   'Never a Dull Moment',
                   'Pension Schöller',
                   'Ransom',
                   'Reunion in France',
                   'Since You Went Away',
                   'The Challenge',
                   'The Hospital',
                   'The Legacy',
                   'The Male Animal',
                   'United!',
                   'Whats in a Name?',
                   'Wyoming')
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
   WHERE gender IN ('f')
     OR gender IS NULL),
     filtered_rt AS
  (SELECT id
   FROM role_type
   WHERE ROLE IN ('composer'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('18')
  AND mi2.info_type_id IN ('3')
  AND mi1.info IN ('Acapulco, Guerrero, Mexico',
                    'Bavaria Filmstudios, Geiselgasteig, Grünwald, Bavaria, Germany',
                    'Big Bear Lake, Big Bear Valley, San Bernardino National Forest, California, USA',
                    'Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Hollywood, Los Angeles, California, USA',
                    'Mexico City, Distrito Federal, Mexico',
                    'Mexico',
                    'New York City, New York, USA',
                    'Philippines',
                    'San Francisco, California, USA',
                    'Warner Brothers Burbank Studios - 4000 Warner Boulevard, Burbank, California, USA')
  AND mi2.info IN ('Adventure',
                    'Biography',
                    'Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Family',
                    'Fantasy',
                    'Film-Noir',
                    'History',
                    'Music',
                    'Musical',
                    'Mystery',
                    'Western');