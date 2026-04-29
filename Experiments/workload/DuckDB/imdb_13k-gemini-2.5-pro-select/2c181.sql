WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND title IN ('(#1.42)',
                   '(#1.53)',
                   '(#1.67)',
                   '(#1.7)',
                   '(#2.34)',
                   '(#2.8)',
                   '(#3.20)',
                   '(#4.30)',
                   '(#5.11)',
                   '(#5.38)',
                   'A Star Is Born',
                   'Above Suspicion',
                   'Anthony Adverse',
                   'Beauty and the Beast',
                   'Blackmail',
                   'Boccaccio',
                   'Caesars Wife',
                   'Calamity Jane',
                   'Dick Tracy',
                   'Dynamite',
                   'Emergency',
                   'Eyewitness',
                   'Finale',
                   'Flash Gordon',
                   'Interlude',
                   'Love',
                   'M',
                   'Man Hunt',
                   'Mr. Smith Goes to Washington',
                   'On Trial',
                   'Pride and Prejudice',
                   'Romeo and Juliet',
                   'Sailor Beware',
                   'Stars and Stripes Forever',
                   'The Conspirators',
                   'The Golden Fleecing',
                   'The Hero',
                   'The Night Riders',
                   'The Red Badge of Courage',
                   'The Shadow',
                   'Up Front',
                   'Welcome Stranger',
                   'You Came Along')
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
   WHERE ROLE IN ('actor',
                   'costume designer',
                   'miscellaneous crew'))
SELECT COUNT(*)
FROM filtered_t AS t
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN filtered_n AS n ON ci.person_id = n.id
JOIN filtered_rt AS rt ON ci.role_id = rt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info AS mi2 ON t.id = mi2.movie_id
WHERE mi1.info_type_id IN ('8')
  AND mi2.info_type_id IN ('4')
  AND mi1.info IN ('Argentina',
                    'Austria',
                    'Brazil',
                    'Czechoslovakia',
                    'Egypt',
                    'Finland',
                    'Iran',
                    'Philippines',
                    'South Korea',
                    'UK',
                    'USA',
                    'Yugoslavia')
  AND mi2.info IN ('Hungarian',
                    'Japanese',
                    'Korean',
                    'Mandarin',
                    'Tagalog',
                    'Turkish');