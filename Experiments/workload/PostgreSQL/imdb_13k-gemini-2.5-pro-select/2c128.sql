WITH filtered_t AS
  (SELECT t.id
   FROM title AS t
   WHERE t.production_year BETWEEN 1950 AND 1990
     AND t.title IN ('(#1.19)',
                   '(#1.242)',
                   '(#1.480)',
                   '(#1.955)',
                   '(#1.968)',
                   '(#3.5)',
                   '(#5.11)',
                   '(#8.8)',
                   'Absolute Beginners',
                   'Act of Vengeance',
                   'All Night Long',
                   'Baburugamu kuraishisu',
                   'Balance of Power',
                   'Bells Are Ringing',
                   'Brookside',
                   'Candida',
                   'Casualty',
                   'Childrens Ward',
                   'Dead Wrong',
                   'Deadly Reunion',
                   'Delivery Boys',
                   'Fire Down Below',
                   'Glitch!',
                   'Happy Returns',
                   'Heat',
                   'La trampa',
                   'Licensed to Kill',
                   'Mightier Than the Sword',
                   'Monkey Business',
                   'Mother, Mother',
                   'Neighbours',
                   'Oliver Twist',
                   'Poetic Justice',
                   'Rough Justice',
                   'Suspicious Minds',
                   'The Aftermath',
                   'The Best of Enemies',
                   'The Deserter',
                   'The Gunman',
                   'The New World',
                   'The Sniper',
                   'Too Hot to Handle',
                   'Too Many Cooks',
                   'V')
     AND t.kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode',
                   'movie',
                   'tv movie',
                   'tv series',
                   'video game',
                   'video movie')))
SELECT COUNT(*)
FROM filtered_t
JOIN cast_info AS ci ON filtered_t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON filtered_t.id = mi1.movie_id
JOIN movie_info AS mi2 ON filtered_t.id = mi2.movie_id
WHERE n.gender IS NULL
  AND rt.role IN ('actor',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'production designer')
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('Dolby SR',
                    'Dolby',
                    'Mono',
                    'Stereo',
                    'Ultra Stereo')
  AND mi2.info_type_id IN ('3')
  AND mi2.info IN ('Adventure',
                    'Biography',
                    'Comedy',
                    'Fantasy',
                    'Horror',
                    'War',
                    'Western');