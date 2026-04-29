
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1950 AND 1990
  AND t.title IN ('(#1.390)',
                   '(#1.428)',
                   '(#1.81)',
                   '(#1.845)',
                   '(#3.5)',
                   'Baby',
                   'Blackjack',
                   'Body Language',
                   'Brutal Glory',
                   'Field of Dreams',
                   'Gotta Dance',
                   'Hearts and Minds',
                   'Jackpot',
                   'Jauche und Levkojen',
                   'Key Exchange',
                   'Lola',
                   'Mistaken Identity',
                   'Picking Up the Pieces',
                   'Sins of the Father',
                   'The Hunt for Red October',
                   'The Root of All Evil',
                   'The Shooting',
                   'Touch and Go',
                   'Vera - Der schwere Weg der Erkenntnis',
                   'Victory',
                   'Visitors')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie',
                   'tv series',
                   'video game',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('3')
       AND mi1.info IN ('Comedy',
                    'Family',
                    'Film-Noir',
                    'Sci-Fi',
                    'Talk-Show',
                    'Western'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('18')
       AND mi2.info IN ('Cinecittà Studios, Cinecittà, Rome, Lazio, Italy',
                    'Los Angeles, California, USA',
                    'Manhattan, New York City, New York, USA',
                    'Munich, Bavaria, Germany',
                    'San Francisco, California, USA'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('editor')
       AND (n.gender IN ('m')
            OR n.gender IS NULL));