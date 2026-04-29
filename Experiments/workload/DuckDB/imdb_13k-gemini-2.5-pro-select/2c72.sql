
SELECT COUNT(*)
FROM title AS t
WHERE t.production_year BETWEEN 1925 AND 1975
  AND t.title IN ('(#1.102)',
                   '(#1.49)',
                   '(#1.87)',
                   '(#2.35)',
                   '(#3.2)',
                   '(#4.2)',
                   '(#4.6)',
                   '(#5.4)',
                   'Airport 1975',
                   'Boy Meets Girl',
                   'Brigadoon',
                   'Cash and Carry',
                   'Dirty Harry',
                   'Ghost Town',
                   'Ginger',
                   'Golden Boy',
                   'Hard Times',
                   'I Dood It',
                   'Inferno',
                   'La dame aux camélias',
                   'Le bossu',
                   'Lets Dance',
                   'Little Women',
                   'Love Story',
                   'Luxury Liner',
                   'Mission to Moscow',
                   'Playmates',
                   'Pressure',
                   'Road to Rio',
                   'Storm Warning',
                   'The Deserter',
                   'The Exile',
                   'The Godfather',
                   'The Hound of the Baskervilles',
                   'The Ladies Man',
                   'The Shadow',
                   'To Catch a Thief')
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('tv movie',
                   'video movie'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('3')
       AND mi1.info IN ('Action',
                    'Crime',
                    'Drama',
                    'Family',
                    'Game-Show',
                    'Music',
                    'Short',
                    'Sport'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi2
     WHERE mi2.movie_id = t.id
       AND mi2.info_type_id IN ('8')
       AND mi2.info IN ('Argentina',
                    'Denmark',
                    'Italy',
                    'Portugal',
                    'South Korea'))
  AND EXISTS
    (SELECT 1
     FROM cast_info AS ci
     JOIN name AS n ON ci.person_id = n.id
     JOIN role_type AS rt ON ci.role_id = rt.id
     WHERE ci.movie_id = t.id
       AND rt.role IN ('director',
                   'production designer')
       AND (n.gender IN ('m')
            OR n.gender IS NULL));